#!/bin/sh
echo "installing tekton on openshift"

# install tekton
curl https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml | yq 'del(.spec.template.spec.containers[].securityContext.runAsUser, .spec.template.spec.containers[].securityContext.runAsGroup)' | oc apply -f -

# install tekton triggers

oc apply --filename \
https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
oc apply --filename \
https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml