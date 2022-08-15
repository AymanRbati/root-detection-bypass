A simple tool for bypassing easy root detection mechanisms. If the app still flags your device as rooted, then Frida FTW.

Usage : 

docker build -t bypassrootdetection .
 
 docker run -it   -v full_path_of_your_apk:/app/input.apk -v output_folder:/app/output/  bypassrootdetection

You should find an apk named generated.aok in the output folder you specified
