#!/bin/sh

echo "Installing kind task from tekton - https://github.com/tektoncd/catalog/blob/main/task/kind/0.1/kind.yaml"
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/master/task/kind/0.1/kind.yaml

echo "Installing git-cloone task from tekton - https://github.com/tektoncd/catalog/tree/main/task/git-clone"
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/master/task/git-clone/0.9/git-clone.yaml

echo "Installing tekton dashboard to view runs"
kubectl apply --filename \
https://storage.googleapis.com/tekton-releases/dashboard/latest/release-full.yaml