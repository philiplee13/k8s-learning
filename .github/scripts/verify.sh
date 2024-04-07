#!/bin/sh

set -e # exit on any error
cd k8s-learning/tekton/dev
kubectl apply ns.yaml

kubectl get ns