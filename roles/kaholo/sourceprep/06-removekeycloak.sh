#!/bin/bash
#
# Twiddlebug's dockerfile has both ENTRYPOINT and CMD and they clash such
# that docker doesn't reliably start on twiddlebug
#
# Replace the bottom line with these two lines:
# ENTRYPOINT []
# CMD rm -f /run/docker/containerd/containerd.pid && bash /usr/local/bin/dockerd-entrypoint.sh dockerd & bash /.scripts/wait-for-server.sh && npm start
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
grep '\-f ../keycloak/docker-compose.yml' package.json
echo MANUAL STEP - remove the red string