#!/bin/sh
echo "installing tekton on minikube using operator"

# installs operator
kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/latest/release.yaml

# installs components - "all"
# https://github.com/tektoncd/operator/blob/main/docs/install.md
kubectl apply -f https://raw.githubusercontent.com/tektoncd/operator/main/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml

# install istio
echo "Installing istio - assumes istioctl is installed"

istioctl install