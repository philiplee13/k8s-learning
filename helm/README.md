## Helm

### What is helm?

- So in short - helm is a package manager for kubernetes, but what does this mean?
  - why is a package manager important?
    - The importance of this is that it abstracts away all of the "knowledge" necessary to run applications on a given server
    - like running postgres for example
    - or running an node application on ubuntu
    - it takes care of where the config files go, how to run it, what commands are needed, etc
- You can essentially define dependencies, install, and upgrade applications in kubernetes
- They use something called `charts`

### Helm Charts

- A generic structure of a helm chart looks like the following
  - `chart.yaml` -> metadata
  - `vaules.yaml` -> default config
    - collection of key-value pairs that represent the configuration values
    - `values.yaml` is the baseline default - we can also use additional values files for more config values
    - if you wanted to use custom values you can specify it during the install command
      - `helm install release ./directory -f custom-values.yaml`
      - can also work as key-value pairs or in the actual cli as well
  - templates -> template manifests
    - `service.yaml`
    - `deployment.yaml`
      - files under the `templates` directory are treated as dynamic yaml templates using go's templating language
      - the values in `values.yaml` are used to generate these manifests to apply in the cluster
