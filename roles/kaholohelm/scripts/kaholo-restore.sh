#!/bin/bash
MK8S_NAMESPACE={{ mk8s_namespace }}
CURRENTDIR=$(pwd)
if [ "$#" -ne 1 ]
then
  echo "Please provide the directory that holds the backup as the only argument."
  echo "  for example:"
  echo "  ./kaholo-restore $MK8S_NAMESPACE-backup-2023-05-10"
  exit 1
fi
echo "Restoring backup located in $CURRENTDIR/$1/"
cd kaholo-helm/scripts/tenants-management
./TENANT_RESTORE.sh $MK8S_NAMESPACE $MK8S_NAMESPACE $CURRENTDIR/$1/
