#!/bin/bash
MK8S_NAMESPACE={{ mk8s_namespace }}
BAKDIR258=$MK8S_NAMESPACE-backup-$(date -I)
mkdir $BAKDIR258
cd kaholo-helm/scripts/tenants-management
./TENANT_DUMP.sh -n $MK8S_NAMESPACE -p ~/$BAKDIR258