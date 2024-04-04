# dashboard.sh just installs the kubernetes-dashboard

echo "This will install the kubernetes dashboard and run the command to view it in local host"
echo "This script assumes you're using minikube"

# Add kubernetes-dashboard repository
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# Deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
# https://github.com/kubernetes/dashboard/issues/8765 - if using minikube
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard --set kong.admin.tls.enabled=false

echo "Finished installed kubernetes-dashboard - now running it"
echo "You are going to need to generate a token - use the following to generate one for a service account"
echo "kubectl -n NAMESPACE create token SERVICE_ACCOUNT"


echo "Running the dashboard - this will take up your terminal"
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443