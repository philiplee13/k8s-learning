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

# install kuttl
curl -SSL "https://github.com/kudobuilder/kuttl/releases/download/v0.15.0/kuttl_0.15.0_linux_x86_64.tar.gz" | tar -xz -C /usr/local/bin

kubectl kuttl version

