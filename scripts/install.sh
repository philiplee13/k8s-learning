#!/bin/sh


set -e # exit on any error

echo "Installing k3s and kubectl"
curl -sfL https://get.k3s.io | sh -
sudo chmod -R a+rw /etc/rancher/k3s
sudo mkdir -p $HOME/.kube && sudo chown -R runner $HOME/.kube
sudo k3s kubectl config view --raw > $HOME/.kube/config
sudo chown runner $HOME/.kube/config
sudo chmod go-r $HOME/.kube/config
kubectl version

