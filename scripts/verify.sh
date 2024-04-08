#!/bin/sh

set -e # exit on any error
cd tekton/kind/dev

kubectl get ns
kustomize build . | envsubst '$NAMESPACE' | kubectl apply -f-

kubectl get ns
kubectl get pods -n $NAMESPACE

# need to invoke the tests here
# also wait for resources to come up