import numpy as np
import matplotlib.pyplot as plt
from scipy.io.wavfile import read
from scipy.signal import resample
import argparse
import glob
import re
import os
import librosa


def convert_to_mono(data):
    """
    Convert signal to mono
    """

    if data.ndim != 1:
        data = np.mean(data, axis=1)
    return data

def resample_signal(data, target_sr=16000):
    return target_sr, resample(data, num=target_sr)


def display_signal(sr, data):
    """
    Visualize the given audio signal.
    
    Args:
        sr: sampling rate of the signal, int
        data: speech signal data, ndarray
    """

    duration = data.size / sr
    x_axis = np.linspace(0, duration, data.size)
    
    # plotting
    plt.plot(x_axis, data)
    plt.xlabel("Time")
    plt.ylabel("Amplitude")
    plt.title("Time domain audio signal")
    #plt.show()


class AudioFeatureExtraction():
    def __init__(self, sr, data, audio_name, frame_size=25, frame_shift=10, num_bins=23):
        self.audio_name = audio_name
        self.sr = sr
        self.data = data
        self.total_samples = self.data.size
        self.frame_size = frame_size
        self.frame_size_samples = int(self.sr*(self.frame_size/1000))
        self.frame_shift = frame_shift
        self.frame_shift_samples = int(self.sr*(self.frame_shift/1000))
        self.total_frames = (self.total_samples - self.frame_size_samples) // self.frame_shift_samples + 1 
        self.fft_size = 1
        while self.fft_size < self.frame_size_samples:
            self.fft_size *= 2
        self.spectrum_dims = int(self.fft_size/2 + 1)
        self.min_freq = 20
        self.max_freq = self.sr//2
        self.num_mel_bins = num_bins

    def display_signal(self):
        """
        Visualize the given audio signal.
    
        Args:
            sr: sampling rate of the signal, int
            data: speech signal data, ndarray
        """

        duration = self.total_samples / self.sr
        x_axis = np.linspace(0, duration, self.total_samples)
    
        # plotting
        plt.plot(x_axis, self.data)
        plt.xlabel("Time")
        plt.ylabel("Amplitude")
        plt.title("Time domain audio signal")
        plt.savefig("./plots/" + self.audio_name + "_signal" + ".png")
        #plt.show()



    def spectrum(self, frame):
        """
        Computes magnitude spectrum of the given audio signal frame.

        Args:
            frame: frame of the audio signal, ndarray
        """

        # apply window to reduce the noise at the edge of each frame
        frame = frame*np.hamming(self.frame_size_samples)

        # compute the spectrum with FFT
        spectrum = np.fft.fft(frame, n=self.fft_size)
        abs_spectrum = np.abs(spectrum)

        # take log of magnitude spectrum
        magnitude_spec = np.log(abs_spectrum + 1e-7)

        # magnitude spectrum is symmetry, thus second half is redundant 
        magnitude_spec = magnitude_spec[:np.int32(self.fft_size/2 + 1)]
 
        return magnitude_spec

    def spectrogram(self, plot=False):
        """
        Computes spectrogram of the given audio signal.
    
        Args:
            plot: if visualize spectrogram or not, bool

        Return:
            spectrogram: spectrogram of the provided audio, ndarray
        """

        # initialize a spectrogram array
        spectrogram = np.zeros((self.total_frames, self.spectrum_dims))
    
        # compute spectrogram
        for i in range(0, self.total_frames):
            start = i*self.frame_shift_samples
            frame = self.data[start : start + self.frame_size_samples].copy()
        
            # compute magnitude spectrum
            magnitude_spec = self.spectrum(frame)

            # store magnitude spectrum to the spectrogram array
            spectrogram[i, : ] = magnitude_spec
    
        if plot:
            plt.imshow(spectrogram.T[-1::-1, :], aspect="auto", extent=[0, self.total_samples/self.sr, 0, self.sr/2])
            plt.xlabel("Time")
            plt.ylabel("Frequencies")
            plt.title("Mel-Spectrogram")
            plt.savefig("./plots/" + self.audio_name + ".png")
            #plt.show()


        #print(f"The dimention of the spectrogram: {spectrogram.shape}")

        return spectrogram


    def herz_to_mel(self, freq):
        return 2595*np.log10((freq/700) + 1)


    def mel_filter_bank(self):
        """
        Creates a Mel-filter bank which contains weights for the magnitude spectrum.
        The dimension of the Mel-filter bank will be (number of Mel bins, spectrum dimension).
        
        Return:
            mel_filter_bank: mel filter for spectrum, ndarray
        """

        # define the points for mel wrapping with the given dimentions (num_mel_bins)
        mel_max = self.herz_to_mel(self.max_freq)
        mel_min = self.herz_to_mel(self.min_freq)
        mel_points = np.linspace(mel_min, mel_max, self.num_mel_bins + 2)

        # initialize an array for mel filter bank features
        mel_filter_bank = np.zeros((self.num_mel_bins, self.spectrum_dims))

        for i in range(self.num_mel_bins):
            # define the three points (left, center, right) for frequency wrapping
            left = mel_points[i]
            center = mel_points[i+1]
            right = mel_points[i+2]

            # define triangle filter 
            for j in range(self.spectrum_dims):

                # calculate the Hrz frequency with respect to j dimention
                freq = 1.0*j*self.sr/2/self.spectrum_dims
                mel = self.herz_to_mel(freq)
                
                if mel > left and mel < right:
                    if mel <= center:
                        weight = (mel - left)/(center - left)
                    else:
                        weight = (right - mel)/(right - center)
                    mel_filter_bank[i][j] = weight
                
        return mel_filter_bank

    def mel_scale_spectrogram(self):
        """
        Computes log Mel-scale spectrogram.
        It is calculated by dot product with the spectrum and Mel-filter bank.
        The dimension of each frame will be ( , the number of Mel bins)
        The output dimension will be then (the number of frames, the number of Mel bins)

        Return:
            mel_scale_spectrogram: mel-scale spectrogram, ndarray
        """

        # initialize an array for mel-scale spectrogram (#frames, #mel_bins)
        mel_scale_spectrogram = np.zeros((self.total_frames, self.num_mel_bins))

        # calculate magnitude spectrum and mel filter bank features for each frame
        for i in range(0, self.total_frames):
            start = i*self.frame_shift_samples
            frame = self.data[start : start + self.frame_size_samples].copy()
            spectrum = self.spectrum(frame)

            # implement mel-scale wrapping
            mel_filter_bank = self.mel_filter_bank()
            mel_spectrum = np.dot(spectrum, mel_filter_bank.T)
            mel_spectrum[mel_spectrum<0.1] = 0.1

            # Take a log of fbank features
            mel_scale_spectrogram[i] = np.log(mel_spectrum)

        # print(f"The dimention of mel_scale_spectrogram: {mel_scale_spectrogram.shape}")

        return mel_scale_spectrogram


    def dct_matrix(self):
        """
        Creates dicrete cosince transform base functioin matrix

        Return:
            dct_matrix: base function for DCT, ndarray
        """

        L = 23
        num_ceps = 13
        dct_matrix = np.zeros((num_ceps, self.num_mel_bins))
        for d in range(num_ceps):
            if d == 0:
                dct_matrix[d] = np.ones(self.num_mel_bins)*1.0/np.sqrt(L)
            else:
                dct_matrix[d] = np.sqrt(2/L)*np.cos(((2.0*np.arange(L)+1)*d*np.pi)/(2*L))
        
        return dct_matrix

    
    def lifter(self):
        """
        Creates a lifter for MFCC

        Return:
            lifter: lifter, ndarray
        """

        Q = 22
        D = np.arange(13)
        lifter = 1.0 + 0.5*Q*np.sin(np.pi*D/Q)
        return lifter


    def mel_frequency_cepstrum_coefficients(self):
        """
        Computes mel frequency cepstrum coefficients (MFCC)

        Return:
            mfcc: MFCC, ndarray
        """

        dct_matrix = self.dct_matrix()
        mel_scale_spectrogram = self.mel_scale_spectrogram()
        mfcc = np.dot(mel_scale_spectrogram, dct_matrix.T)
        lifter = self.lifter()
        mfcc *= lifter
        
        #print(f"The dimension of MFCC: {mfcc.shape}")

        return mfcc



if __name__ == "__main__":

    # parse arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--audio_dir", default="audio_samples", type=str, required=True, help="path to the directory containing audio samples")
    parser.add_argument("--feature_type", choices=["spectrogram", "mel-spectrogram", "MFCC"], required=True, help="feature type")
    args = parser.parse_args()

    # load audio data
    root = args.audio_dir
    audios = glob.glob(root + "*.wav")
    for audio in audios:
        data, sr = librosa.load(audio, sr=None)
        data = convert_to_mono(data)
        # sr, data = resample_signal(data)
        audio_name = os.path.splitext(os.path.basename(audio))[0]
        
        feature_extractor = AudioFeatureExtraction(sr, data, audio_name)
        feature_extractor.display_signal()

        feature_type = args.feature_type

        if feature_type == "spectrogram":
            feature_extractor.spectrogram(plot=True)

        elif feature_type == "mel-spectrogram":
            feature_extractor.mel_scale_spectrogram()

        elif feature_type == "MFCC":
            feature_extractor.mel_frequency_cepstrum_coefficients()
