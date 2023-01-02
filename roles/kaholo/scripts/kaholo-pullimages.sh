#!/bin/bash
# 
# pulls pre-built kaholo images from a docker image repo
#
SERVER=nexus-a.kaholodemo.net
RELEASE=507-60fa
while read image; do
  echo "$image"
  docker pull $SERVER/$RELEASE/$image
  docker tag $SERVER/$RELEASE/$image $image
done <images.txt