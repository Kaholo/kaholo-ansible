#!/bin/bash
#
# deletes all local docker images to clear disk space
# this will break containers that use deleted images!!
#
cd /home/ubuntu
docker image ls -q > images_to_destroy.txt
docker image rm -f $(cat images_to_destroy.txt)