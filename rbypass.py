import argparse,os
from dockerftw import calling_docker

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
