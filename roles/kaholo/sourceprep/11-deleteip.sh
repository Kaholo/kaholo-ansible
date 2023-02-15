#!/bin/bash
#
# Next delete IP and anything not required to actually run the docker-compose
#
cd /home/ubuntu/kaholo-enterprise/
sudo rm -r `find . -name src | grep -v 'node_modules\|shared\|image'`
sudo rm -r .git
sudo rm -r e2e