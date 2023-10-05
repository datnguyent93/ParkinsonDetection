import numpy as np
import matplotlib.pyplot as plt
from scipy.io.wavfile import read
from scipy.signal import resample
import argparse
import glob
import re
import librosa
import librosa.display
import IPython.display as ipd

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
        ipd.Audio(audio)
        data, sr = librosa.load(audio, sr=None)
        mel_spectrogram = librosa.feature.melspectrogram(data, sr = sr, n_fft = 2048, hop_length = 512, n_mels = 90)
        log_mel_spectrogram = librosa.power_to_db(mel_spectrogram)
        plt.figure(figsize = (25, 10))
        librosa.display.specshow(log_mel_spectrogram, x_axis = "time", y_axis = "mel", sr = sample_rate)
        plt.colorbar(format = "%+2.f")
        plt.show()