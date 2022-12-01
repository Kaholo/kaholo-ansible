#!/bin/bash
#
# pushes images to a docker image repo, e.g. Nexus
# must do docker login before this can work!
#
# docker login -u kaholo -p ******** nexus-a.kaholodemo.net
#
cd /home/ubuntu/
SERVER=nexus-a.kaholodemo.net
RELEASE=506-20221201
while read image; do
  echo "$image"
  docker tag $image $SERVER/$RELEASE/$image
  docker push $SERVER/$RELEASE/$image
done <images.txt