#!/bin/bash
#
# Console is required to generate index.html among other essential files
# It runs only once and takes a minute to populated the needed files and exit
# After that it needn't ever be restarted
#
# run this only once to affect only first occurance of "off", which is console
cd /home/ubuntu/kaholo-enterprise/docker-development/
sed -i '0,/off/{s/off/prod/}' docker-development.yml