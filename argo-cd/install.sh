#!/bin/sh

# installs argo into argocd ns
# assumes minikube is running

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "You can access the dashboard by port fowarding\n"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443\n"
echo "Or you can set up ingress or set up something else - view the docs for more info\n"
echo "https://argo-cd.readthedocs.io/en/stable/getting_started/ \n"

echo "You're also going to need the pw - find it using the cli by running \nargocd admin initial-password -n argocd\n"
echo "Or you can find it by decoding the secret \n kubectl get secret argocd-initial-admin-secret -n argocd --template={{.data.password}} | base64 -D"
