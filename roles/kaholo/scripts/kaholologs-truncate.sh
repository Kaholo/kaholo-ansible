#!/bin/bash
#
# deletes docker-compose logs so they are more managable in size
#
echo Before using this 'sudo su' to root. User ubuntu has no access to these logs.
truncate -s 0 /var/lib/docker/containers/*/*-json.log