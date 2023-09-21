#!/bin/bash
MK8S_NAMESPACE={{ mk8s_namespace }}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
kubectl exec -it -n $MK8S_NAMESPACE `kubectl get pods -n $MK8S_NAMESPACE | grep mongodb-0 | awk '{ print $1 }'` -- bash
