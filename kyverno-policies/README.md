# Kyverno policies
## This folder will contain simple kyverno policies
### What is [kyverno](https://kyverno.io/docs/introduction/)?
- Kyverno is a policy engine for kubernetes
- A Policy engine allows you to block resources from being created within your cluster if they don't meet certain requirements
### Examples will include
- Namespace validation (must have name label)
- Namespace validation (must not use the label admin-only)
- Deployments must have replica count of greater than 2

### Resources
- conditionals - use either [preconditions](https://kyverno.io/docs/writing-policies/preconditions/) or anchors
- [external data sources](https://kyverno.io/docs/writing-policies/external-data-sources/)
- [jmespath](https://kyverno.io/docs/writing-policies/jmespath/#custom-filters)
    - [jmespath specifications](https://jmespath.org/specification.html)