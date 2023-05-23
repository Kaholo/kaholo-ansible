#!/bin/bash
#
# After a helm chart upgrade the Ingress will be using "Kubernetes Ingress Controller Fake Certificate" again
# This script patches it to use the Let's Encrypt, which remains because of the original ansible deployment
#
MK8S_NAMESPACE={{ mk8s_namespace }}
DOMAIN={{ domain }}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
kubectl -n $MK8S_NAMESPACE patch ingress $MK8S_NAMESPACE.$DOMAIN --type=json -p='[{"op": "add", "path": "/spec/tls/0/secretName", "value": "{{ mk8s_namespace }}-tls"}]'