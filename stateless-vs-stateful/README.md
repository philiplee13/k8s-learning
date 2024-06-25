## Stateless vs. Stateful applications

### What are stateless applications?

- Basically things that don't require data to be held within the application
- websites / web apps are usually stateless
  - they might talk to a database that's hosted, but the app itself doesn't maintain any data
- kubernetes is best known to manage stateless applications
  - pods are interchangeable
  - scaling operations won't cause any data loss

### What are stateful applications?

- These are things where the data and storage outlives the lifecycle of the individual container replicas
  - so if you were hosting a database within kubernetes, that would need to be a stateful set

#### When should we use stateful sets?

- So some examples of when to use stateful sets are
  - stable, unique network identifiers
  - stable, persistent storage
  - ordered, graceful deployment and scaling
    - resource A needs to be up first -> then resource B -> then resource C
  - ordered, automated rolling updates

### Notes

- it seems like stateful sets are a bit more involved to get setup correctly
- so for generic applications - deployments might just be simplier and easier to setup
- the `yaml` manifests are for deployments - not going to go over stateful sets at this time
