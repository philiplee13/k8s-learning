### Ingress
So for ingress in kubernetes - there's 2 parts
- what is ingress?
    - ingress will serve as an entry point to your cluster
    - by default, pods and services can really only talk to each other within the cluster
    - if you want to expose anything to the outside world - you need ingress
- ingress controller
    - the ingress controller is more often a third-party service like nginx, istio, haproxy that sits in your cluster and watches for rules to be added
    - it essentially maps your manifests that are defined to the services
    - ingress controllers are just pods - they still need to be exposed to the outside via service of nodeport or loadbalancer
- ingress manifests
    - the ingress manifests are the stuff you define that the ingress controller picks up
    - these are basically the rules you define to route traffic, these are picked up by the ingress controller

#### Helpful resources
- https://thenewstack.io/kubernetes-ingress-for-beginners/


#### Minikube specific
- enable the ingress add-on (default is nginx)
    - `minikube addons enable ingress`
- If on mac - need to run `minikube tunnel`
    - https://stackoverflow.com/questions/70961901/ingress-with-minikube-working-differently-on-mac-vs-ubuntu-when-to-set-etc-host
- if you want to curl using dns - modify the /etc/hosts
    - if you do modify the /etc/hosts - you should be able to curl using `curl http://philip-hello-world.example`
