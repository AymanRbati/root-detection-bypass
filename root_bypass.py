#!/usr/bin/python3


import argparse,os,docker


def calling_docker(input,output):
    client = docker.from_env()

    imageTag="aymanrb/root_detection_bypass"
    volumes=[input+':/home/input.apk',output+':/app/output/']
    command = ""

    try:
          appContainer = client.containers.run(
            image=imageTag,
            remove=True,
            stdout=False,
            stderr=True,
            network_mode="host",
            volumes=volumes,
            privileged=True,
            command=command
          )
          output+="/generated.apk"
          print(f"if everything went well, the path of the APK without root detection is : {output}")
          print("Happy Hacking !")
       
    except docker.errors.ContainerError as c:
          print(c)
    except Exception as e:
          print(e)



parser = argparse.ArgumentParser(
    description="""
A simple tool for bypassing easy root detection mechanisms.
Examples usage : 
      $ bypasser -i /tmp/target.apk -o /tmp/output
      $ bypasser -i /tmp/target.apk
      $ bypasser --help
    """,
    formatter_class=argparse.RawDescriptionHelpFormatter
  )

parser.add_argument("-i","--input",type=str, help="the full path of your apk",required=True)
parser.add_argument("-o","--output",type=str, help="the full path of the folder where the new apk will be generated. Otherwise, the folder 'output' will be created/used in the current directory.",required=False)
args = parser.parse_args()

folder ="output"
os.chdir(".")
pwd=os.getcwd()
input=args.input
output=args.output

if("/" not in input):
    print("Please provide the full path of your apk")
    sys.exit(0) 

if(args.output is None):
    output=pwd+"/output"
    if not os.path.isdir(folder):
        os.mkdir(folder)
  

calling_docker(input,output)
