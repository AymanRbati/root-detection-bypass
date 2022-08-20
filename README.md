A simple tool for bypassing easy root detection mechanisms. If the app still flags your device as rooted, then Frida FTW.

> Requirements: 

- Python >= 3.9 and pip installed
- Docker installed
- The following python packages :
    - argparse : pip install argparse
    - docker   : pip install docker==2.0.0

> Usage : 

```rbypass.py -i full_path_of_your_apk -o output_folder```

```rbypass.py -i full_path_of_your_apk ```

if u didn't specify a value for ```-o``` , a folder named ```output``` will be created or used (if it alerady exists).

You should find an apk named **generated.apk** in the output folder 

This tool was only tested on Linux for the moment.