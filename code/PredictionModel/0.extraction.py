import os
import glob
import numpy as np
import matplotlib.pyplot as plt
import librosa
# OSError: cannot load library 'libsndfile.dll': error 0x7e
# workaround:
    # pip uninstall soundfile
    # pip install soundfile
import soundfile
import warnings
warnings.filterwarnings('ignore')

def convert_to_mono(data):
    """
    Convert signal to mono
    """

    if data.ndim != 1:
        data = np.mean(data, axis=1)
    return data

class AudioFeatureExtraction():
    def __init__(self, audio_name, sr, data: np.ndarray, save_path, frame_size=25, frame_shift=10):
        self.audio_name = audio_name
        self.sr = sr
        self.data = data
        self.save_path = save_path
        self.total_samples = self.data.size
        self.frame_size = frame_size
        self.frame_shift = frame_shift
        self.frame_size_samples = int(self.sr*(self.frame_size/1000))
        self.frame_shift_samples = int(self.sr*(self.frame_shift/1000))
        self.total_frames = (self.total_samples - self.frame_size_samples) // self.frame_shift_samples + 1
        self.fft_size = 1
        while self.fft_size < self.frame_size_samples:
            self.fft_size *= 2
        self.spectrum_dims = int(self.fft_size / 2 + 1)

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
            plt.savefig(os.path.join(self.save_path, self.audio_name + ".png"))

        return spectrogram

file_path = os.path.dirname(__file__)
root = os.path.dirname(os.path.dirname(file_path))
audio_path = os.path.join(root, "Audio/") # Path to the audio folder
save_path = os.path.join(root, "Speech/") # Path to the speech folder
audios = glob.glob(audio_path + "*.wav") # List of audio files

for audio in audios:
    audio_name = os.path.splitext(os.path.basename(audio))[0] # Gets the audio file's name
    data, sr = librosa.load(audio, sr=None) # Load an audio file as a floating point time series
    data = convert_to_mono(data) # Converts the loaded audio file to mono if it is in stereo
    
    feature_extractor = AudioFeatureExtraction(audio_name, sr, data, save_path)
    feature_extractor.spectrogram(True)
