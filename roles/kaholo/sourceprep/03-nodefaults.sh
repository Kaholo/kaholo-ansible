#!/bin/bash
#
# kaholo comes with default plugins, vault entries, and license
# These get re-installed with every restart, which is a nusciance for a production system
#
cd /home/ubuntu/kaholo-enterprise/
rm docker-development/mongo-setup/dump/kaholo/license*
rm docker-development/mongo-setup/dump/kaholo/plugin*
rm docker-development/mongo-setup/dump/kaholo/vault*
rm e2e/assets/plugins/*
rm e2e/assets/dump/kaholo/licenses*
rm e2e/assets/dump/kaholo/vaults*
rm e2e/assets/dump/empty/kaholo/licenses*
rm e2e/assets/dump/empty/kaholo/vaults*