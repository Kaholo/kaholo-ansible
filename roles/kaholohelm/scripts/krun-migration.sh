#!/bin/bash
#
# After a helm chart upgrade the Ingress will be using "Kubernetes Ingress Controller Fake Certificate" again
# This script patches it to use the Let's Encrypt, which remains because of the original ansible deployment
#
MK8S_NAMESPACE={{ mk8s_namespace }}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
cp /var/snap/microk8s/current/credentials/client.config client.config
chmod 400 client.config
export KUBECONFIG=client.config
helm rollback $(helm list --no-headers -n $MK8S_NAMESPACE | awk '$1 {print$1}') $(helm list --no-headers -n $MK8S_NAMESPACE | awk '$3 {print$3}') -n $MK8S_NAMESPACE
