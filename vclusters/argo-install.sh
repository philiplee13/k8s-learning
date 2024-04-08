#!/bin/sh

# installs argo into argocd ns
# assumes minikube is running

kubectl create namespace argocd
kubectl create namespace argo
kubectl create namespace argo-events
kubectl create namespace vcluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "You can access the dashboard by port fowarding\n"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443\n"
echo "Or you can set up ingress or set up something else - view the docs for more info\n"
echo "https://argo-cd.readthedocs.io/en/stable/getting_started/ \n"

echo "You're also going to need the pw - find it using the cli by running \nargocd admin initial-password -n argocd\n"
echo "Or you can find it by decoding the secret \n kubectl get secret argocd-initial-admin-secret -n argocd --template={{.data.password}} | base64 -D"


echo "argo workflows"
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.5.5/install.yaml
kubectl patch deployment \
  argo-server \
  --namespace argo \
  --type='json' \
  -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/args", "value": [
  "server",
  "--auth-mode=server"
]}]'


echo "argo events"
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-events/stable/manifests/install.yaml
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-events/stable/manifests/install-validating-webhook.yaml
kubectl apply -n argo-events -f https://raw.githubusercontent.com/argoproj/argo-events/stable/examples/eventbus/native.yaml

