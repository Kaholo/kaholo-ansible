#!/bin/bash
NAMESPACE_SUFFIX={{ mk8s_namespace }}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
kubectl exec -it -n kaholo-$NAMESPACE_SUFFIX `kubectl get pods -n kaholo-$NAMESPACE_SUFFIX | grep agent | awk '{ print $1 }'` -- bash