#!/bin/sh

set -e # exit on any error
cd tekton/dev
kubectl apply ns.yaml

kubectl get ns