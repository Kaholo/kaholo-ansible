#!/bin/bash
#
# After a helm chart upgrade the Ingress will be using "Kubernetes Ingress Controller Fake Certificate" again
# This script patches it to use the Let's Encrypt, which remains because of the original ansible deployment
#
NAMESPACE_SUFFIX={{namespace_suffix}}
DOMAIN={{domain}}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
kubectl -n kaholo-$NAMESPACE_SUFFIX patch ingress $NAMESPACE_SUFFIX.$DOMAIN --type=json -p='[{"op": "add", "path": "/spec/tls/0/secretName", "value": "kaholo-{{namespace_suffix}}-tls"}]'