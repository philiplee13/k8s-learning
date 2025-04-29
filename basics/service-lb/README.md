## Service loadbalancer on baremetal

- `base.yaml` -> applies the service and pod
- `kind-config.yaml` -> applies kind config, 1 master and 2 workers
- `metallb-config.yaml` -> ip of docker container that `kind` is running
  - `kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml`
- need `docker-mac-net-connect` running as well
- then you should be able to curl the `svc` that comes up
