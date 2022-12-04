#!/bin/bash
#
# Stops Kaholo running, e.g. to prepare for backup or reboot
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
npm run compose -- stop