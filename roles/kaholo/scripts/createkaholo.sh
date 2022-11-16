#!/bin/bash
#
# up with --no-start creates the containers but does NOT start them
#
cd /home/ubuntu/kaholo-enterprise/docker-development/
npm run compose -- up --no-start
