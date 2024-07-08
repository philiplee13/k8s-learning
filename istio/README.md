## Istio

### Using k3ds

- make sure to create a cluster using the below command
    - k3d cluster create --api-port 6550 -p '9080:80@loadbalancer' -p '9443:443@loadbalancer' --agents 2 --k3s-arg '--disable=traefik@server:*'
        - the -p flag Map ports from the node containers (via the serverlb) to the host
        - [docs](https://k3d.io/v5.3.0/usage/commands/k3d_cluster_create/)
- docs: https://k3d.io/v5.4.3/design/concepts/

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

#### Folder Structure

- `certs` -> cert-manager-operator and how to encrypt certs
- `traffic` -> traffic management policies in istio -> `ingress`, `serviceentries`, `gateways`, etc
