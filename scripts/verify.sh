#!/bin/sh

set -e # exit on any error
cd tekton/kind/dev
kubectl apply ns.yaml

kubectl get ns