#!/bin/sh

set -e # exit on any error
cd tekton/kind/dev

kubectl get ns
kubectl apply -k kustomization.yaml

kubectl get ns
kubectl get pods -n $NAMESPACE