#!/bin/bash
NAMESPACE_SUFFIX={{namespace_suffix}}
shopt -s expand_aliases
alias kubectl="microk8s kubectl"
kubectl exec -it -n kaholo-$NAMESPACE_SUFFIX `kubectl get pods -n kaholo-$NAMESPACE_SUFFIX | grep agent | awk '{ print $1 }'` -- bash