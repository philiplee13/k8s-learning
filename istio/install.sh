#!/bin/sh

# installs istio with demo profile
# https://istio.io/latest/docs/setup/additional-setup/config-profiles/
echo "This install of istio will block outbound traffic to be only in the registry"
echo "So once this is installed - try sending a request to anything outside of the cluster, and it should be blocked"
istioctl install --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY

echo "Finished installing - find the running pod of sleep with"
echo "export SOURCE_POD=$(kubectl get pod -l app=sleep -n test-ns -o jsonpath='{.items..metadata.name}')"
echo "Then send a request using kubectl exec $SOURCE_POD -n test-ns -c sleep -- curl -sSI https://www.google.com"
