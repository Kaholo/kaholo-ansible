#!/bin/bash
# 
# Stops and deletes kaholo containers, volumes, project for fresh restart
# does not delete images
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
npm run down
cd /home/ubuntu
sudo rm -rf .kaholo
sudo rm -rf kaholo-enterprise
docker system prune --volumes -f