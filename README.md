# Android Root Detection Bypass

A simple tool for bypassing easy root detection mechanisms. The tool will patch the APK and try to disable root detection checks.

If the app still flags your device as rooted, then Frida FTW.

## Requirements

1. Python 3 and pip
2. Docker

## Usage

### CLI

The `root_bypass.py` script is just a CLI with a docker image with the necessary tools as a backend.

```sh
pip install -r requirements.txt
./root_bypass.py -i full_path_of_your_apk -o full_path_of_output_folder # Will generate an APK with the name generated.apk in output_folder
./root_bypass.py -i full_path_of_your_apk # Will create a folder named output with the generated APK in it
```

### Docker

```sh
# Build the image
docker build -t root_detection_bypass .
# Run 
docker run -v full_path_to_your_apk:/home/input.apk -v full_path_of_output_folder:/app/output/ aymanrb/root_detection_bypass

# Or run the image from Docker Hub
docker run -v full_path_to_your_apk:/home/input.apk -v full_path_of_output_folder:/app/output/ aymanrb/root_detection_bypass
```

## Supported platforms

This tool was only tested on Linux, but it should work on Windows too.
