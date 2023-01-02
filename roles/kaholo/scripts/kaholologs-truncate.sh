#!/bin/bash
#
# deletes docker-compose logs so they are more managable in size
#
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

truncate -s 0 /var/lib/docker/containers/*/*-json.log