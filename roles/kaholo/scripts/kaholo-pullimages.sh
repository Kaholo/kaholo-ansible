#!/bin/bash
# 
# pulls pre-built kaholo images from a docker image repo
#
SERVER=nexus-a.kaholodemo.net
RELEASE=510-20230215
while read image; do
  echo "$image"
  docker pull $SERVER/$RELEASE/$image
  docker tag $SERVER/$RELEASE/$image $image
done <images.txt