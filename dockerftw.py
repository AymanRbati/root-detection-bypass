#!/usr/bin/python3

import docker


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
       
    except docker.errors.ContainerError as c:
          print(c)
    except Exception as e:
          print(e)
