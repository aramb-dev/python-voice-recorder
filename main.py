import sounddevice as sd
import soundfile as sf
import time
import threading

def record_audio(duration):
    # Start recording
    print(f"Recording for {duration} seconds...")
    audio = sd.rec(int(duration * 44100), channels=1)

    # Countdown the duration
    def countdown():
        for i in range(duration, 0, -1):
            print(f"Recording ends in {i} seconds...")
            time.sleep(1)

    countdown_thread = threading.Thread(target=countdown)
    countdown_thread.start()

    # Wait for the countdown thread to finish
    countdown_thread.join()

    sd.wait()

    # Save the recorded audio to a file
    file_name = input("Enter the file name to save the recording: > ").strip()
    file_name += ".wav"
    sf.write(file_name, audio, 44100)

    print(f"Audio recorded and saved to {file_name}")

# Get user input
duration = int(input("Enter the duration of the recording in seconds: "))

# Start recording
record_audio(duration)