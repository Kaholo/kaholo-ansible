#!/bin/bash
#
cd /home/ubuntu
git clone git@github.com:Kaholo/kaholo-enterprise.git
cd /home/ubuntu/kaholo-enterprise
git tag | grep kaholo
git checkout kaholo/5.1.0