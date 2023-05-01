#!/bin/bash
NAMESPACE_SUFFIX={{namespace_suffix}}
BAKDIR258=$NAMESPACE_SUFFIX-backup-$(date -I)
mkdir $BAKDIR258
cd kaholo-helm/scripts/tenants-management
./TENANT_DUMP.sh $NAMESPACE_SUFFIX ~/$BAKDIR258/$NAMESPACE_SUFFIX
