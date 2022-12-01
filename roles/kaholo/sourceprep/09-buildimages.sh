#!/bin/bash
#
# This is a big step, takes hours, to build the docker images
# build-code-image only necessary for local testing prior to pushing images
cd /home/ubuntu/kaholo-enterprise/docker-development/
npm run build-code-image
npm run build