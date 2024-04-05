## ArgoCD

### This repo will cover some basics of argocd
- ArgoCD [Docs](https://argo-cd.readthedocs.io/en/stable/getting_started/)
- Get admin password by `argocd admin initial-password -n argocd`


### Options as of now
- post sync hook
    - this is benefical for e2e tests to run after everything has been synced with the annotation of
        - `argocd.argoproj.io/hook: PostSync`
    - can keep delete the job if successful using the annotation
        - `argocd.argoproj.io/hook-delete-policy: HookSucceeded`
    - the issue this comes with is that can only be ran on whatever branch argo is pointing
        - so probably main
    - how can I test individual branches on a cluster?
        - perhaps vClusters + argoCD PR generator?
        - talk: https://www.youtube.com/watch?v=casLvZWlIDw
        - https://github.com/mtougeron/hundreds-of-clusters-demo/blob/main/
        - what does a vCluster do?
            - this looks like it provisions a virtual cluster
            - then you would need to set the KUBECONFIG to access the cli
            - now the question becomes -> how can we run test suites aganist it?
