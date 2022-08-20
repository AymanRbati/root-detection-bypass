rBypass Utility
=====================

A simple tool for bypassing easy root detection mechanisms. The tool will patch the target Apk and try to disable root detection checks. If the app still flags your device as rooted, then Frida FTW.


Requirements
--------------------------

1. Python >= 3.9 and pip installed
2. Docker installed
3. The following python packages :
    - argparse : pip install argparse
    - docker   : pip install docker==2.0.0

Usage
------

```rbypass.py -i full_path_of_your_apk -o output_folder```

```rbypass.py -i full_path_of_your_apk ```

if u didn't specify a value for ```-o``` , a folder named ```output``` will be created in the current directory or used (if it alerady exists).

You should find an apk named **generated.apk** in the output folder you specified

Usage via Docker
------------------

if you don't want to run the docker image in the cloud or use python for some reason, you can always build and run the Docker image locally :

```cd docker```

```docker build -t  aymanrb/root_detection_bypass .```
 
``` docker run -it   -v full_path_of_your_apk:/home/input.apk -v output_folder:/app/output/   aymanrb/root_detection_bypass```


Supported platforms
---------------------

This tool was only tested on Linux for the moment.