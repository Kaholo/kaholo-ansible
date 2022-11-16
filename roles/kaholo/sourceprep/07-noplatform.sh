#!/bin/bash
#
# The docker-compose.yml declares "platform: linux/x86_64" and this causes
# the build to fail in Azure. Delete these three lines.
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
grep -v platform docker-compose.yml > tempfile.yml && mv tempfile.yml docker-compose.yml