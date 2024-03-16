# Kyverno policies
## This folder will contain simple kyverno policies
### What is [kyverno](https://kyverno.io/docs/introduction/)?
- Kyverno is a policy engine for kubernetes
- A Policy engine allows you to block resources from being created within your cluster if they don't meet certain requirements
### Examples will include
- Namespace validation (must have name label)
- Namespace validation (must not use the label admin-only)
- Deployments must have replica count of greater than 2