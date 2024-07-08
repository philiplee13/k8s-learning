## Pod to pod communication inside of the cluster

So within kubernetes, pods should be able to talk to each other
we'll have a few files here

### Pod to pod communication in same ns
- ns.yaml -> creates the namespace
- deployment.yaml -> creates the deployment, notice the `label` block, that's the selector that the service will use
- service.yaml -> exposes the deployment so we can curl it
- pod.yaml -> pod for testing, gets created in the same namespace
    - inside the pod you might need to install a few utils
    - dnsutils
    - curl
- if everything goes well you should just be able to `curl test-service` and see the nginx welcome

### Pod to pod communication across namespaces
- new-ns.yaml -> new ns to run a pod in
- new-pod.yaml -> pod in new ns, see if you can curl it from another namespace
    - for a pod in one namespace to talk to another pod in another namespace - you need to use the FQDN of the service
    - usually it looks like <svc>.<svc-namespace>.svc.cluster.local
    - you can also use the syntax of <svc>.<svc-namespace>
- so `curl test-service.test` should work

