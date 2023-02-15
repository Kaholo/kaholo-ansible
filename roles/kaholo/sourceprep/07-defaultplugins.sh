#!/bin/bash
#
# The docker-compose.yml declares "platform: linux/x86_64" and this causes
# the build to fail in Azure. Delete these three lines.
#
# MUST HAVE files pluginDefinitions.zip  plugins.zip  uploads.zip start.sh in ~
cd /home/ubuntu/kaholo-enterprise/docker-development/mongo-setup
cp ~/start.sh .
cd /home/ubuntu/kaholo-enterprise/docker-development/mongo-setup/dump/kaholo
unzip ~/pluginDefinitions.zip
# unzip ~/licenses.zip
cd /home/ubuntu/kaholo-enterprise/docker-development/server/assets/libs/plugins
unzip ~/plugins.zip
cd /home/ubuntu/kaholo-enterprise/docker-development/server/assets/static_cdn/uploads
unzip ~/uploads.zip

