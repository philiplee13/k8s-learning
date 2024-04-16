## Istio

### What is istio?
- Istio is an implementation of a service mesh
    - For what is a service mesh - look at [this](https://buoyant.io/service-mesh-manifesto)
    - TLDR; a service mesh is a dedicated infra layer that handles
        - observability
        - logging
        - traffic management
        - security
    - all without having to config things in the application itself

### How Istio works
- So istio has 2 components
    - data plane
        - the data plane is the communication between services
        - composed of a set of proxies ([Envoy Proxies](https://www.envoyproxy.io/docs/envoy/v1.29.3/intro/what_is_envoy)) that are deployed as sidecars
        - these proxies mediate and control all traffic between services
    - control plane
        - the one that configures and manages the proxies to route traffic accordingly
    - view the architecture [here](https://istio.io/latest/docs/ops/deployment/architecture/)

#### What the files do
- install.sh
    - this installs istio into the cluster - with outbound traffic being blocked by [default](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-control/)
    - `meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY`
        - to test this - run the commands
            - `export SOURCE_POD=$(kubectl get pod -l app=sleep -n test-ns -o jsonpath='{.items..metadata.name}')` -> gets the running pod
            - `kubectl exec $SOURCE_POD -n test-ns -c sleep -- curl -sSI https://www.google.com"`
            - You should see two things - one log with error code of 35 - SSL_ERROR_SYSCALL
            - And then if you check the logs of the proxy -> you should see something along the lines of a `BlackHoleCluster`
                - blackholeclusters are requests that are dropped by envoy
- ns.yaml
    - namespace that injects sidecar for the entire namespace
- service-entry.yaml
    - service entry configs that allow outbound traffic
    - it'll create two - one http for httpbin.org
        - test by running `kubectl exec "$SOURCE_POD" -n test-ns -c sleep -- curl -sSI http://httpbin.org/headers`
            - should get back a 200 - also show in logs `ubectl logs "$SOURCE_POD" -n test-ns -c istio-proxy | tail`
    - next one is https for google.com
        - test by running `kubectl exec "$SOURCE_POD" -n test-ns -c sleep - curl -sSI https://www.google.com`
            - should also get back a 200

