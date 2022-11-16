#!/bin/bash
#
# Get npm working and build the docker-compose.yml file
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
npm install
npm run build-compose-file