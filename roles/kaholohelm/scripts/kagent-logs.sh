#!/bin/bash
MK8S_NAMESPACE={{ mk8s_namespace }}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
kubectl logs -f -n $MK8S_NAMESPACE `kubectl get pods -n $MK8S_NAMESPACE | grep agent | awk '{ print $1 }'`