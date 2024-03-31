## This will go over RBAC in kubernetes

### What is RBAC?
- RBAC stands for Role Based Access Control
- This is important to set permissions for multiple devs or teams within an org
- Given an example of 2 teams
    - team a
    - team b
    - we don't want developers in team a to see resources in team b

### Roles
- Roles are a representation of a set of privlieges to resources
- typically it's going to be you assign a "verb" to a "noun"
    - Example here being "get", "list" for "pods" and "deployments"
- Roles typically define what you can do to a given resource
- But typically roles by themselves don't do anything - you still need to assign them to a user

### Role Bindings
- a mapping between a person and a role
- a person can have multiple roles
- you can also specify groups as well
    - groups can make it easier to manage permissions

### Namespaced vs. Cluster resources
- As the name implies - resources can be seperated into two different areas
    - Namespaced
        - specific to a given namespace
        - example here would be services or pods
    - Clusters
        - availble to the entire cluser
        - Example here would be like a CRD (custom resource definition)
        - if you create a cluster role - any person who gets that role will have access to the entire cluster / cluster resources / permissions to any namespace within a cluster

### Service Accounts
- Service accounts are non human accounts that live in each namespace
- By default - a service account named "default" is created under each namespace when created
- They get default permissions as well, but it's best to explicity define roles and bind them to service accounts
- One way to test authentication is to use the following
    - `kubectl auth can-i <verb> <resource> --as=system:serviceaccount:<namespace>:<serviceaccountname> [-n <namespace>]`


### Dashboard
- This also includes a script to download the dashboard [here](https://github.com/kubernetes/dashboard/tree/master)
- We should be able to login via admin and see everything
- As well as login as service account and only see what we "own"


### Examples
- create role and role binding for namespace -> validate in dashboard that you can't see other ns
- create cluster role and role binding for cluster -> validate in dashboard that we can see everything
- generate a token for a service account by using `kubectl create token -n namespace serviceaccount`