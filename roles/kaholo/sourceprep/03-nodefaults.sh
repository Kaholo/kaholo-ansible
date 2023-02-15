#!/bin/bash
#
# kaholo comes with default plugins, vault entries, and license
# These get re-installed with every restart, which is a nusciance for a production system
#
cd /home/ubuntu/kaholo-enterprise/docker-development
rm mongo-setup/dump/kaholo/license*
rm mongo-setup/dump/kaholo/plugin*
rm mongo-setup/dump/kaholo/vault*
rm server/assets/static_cdn/uploads/*
rm -rf server/assets/libs/plugins/*