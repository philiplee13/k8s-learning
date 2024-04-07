#!/bin/sh

set -e # exit on any error
cd tekton/kind/dev
kubectl get ns
kubectl apply -f ns.yaml

kubectl get ns