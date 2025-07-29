## Scheduling

- Scheduling refers to making sure that pods are assigned to a given node so that Kubelet can run them
  - what is kubelet?
    - works as a node-level agent that helps out with container orchestration and container management
    - faciliates communication between the control plane and individual nodes

### Kube-scheduler

- this is the default scheduler in kubernetes - can write a custom scheduler if you want
- in a given cluster, the nodes that meet the scheduling requirements for a pod are called `feasible`
  - if no nodes are feasiable - then the pod remains unscheduled until the scheduler is able to place it
- the scheduler finds feasible nodes and then runs a series of functions that help determine the score for all feasible nodes and then places the pod on the highest scoring one
- scheduler then notifies the apiserver about this decision in a process called `binding`

### Node selection

- happens in a 2 step process
  - filtering
    - filters for nodes that are feasible, has enough allocation, etc
  - scoring
    - then scores each of the feasible nodes and places the pod on the highest scoring node

## Taints and Tolerations

- `Node affinity` is a property of pods that attracts them to a set of nodes
  - either preference or a hard requirement
- `Taints` - allow a node to repel a set of pods
  - both of the above are specific to nodes
- `Tolerations` - applied at the pod
  - allows the scheduler to schedule pods with matching taints
  - toleration allows scheduling but doesn't guarantee it
- taints and tolerations both work together to ensure that pods are not scheduled on specific nodes

### Use cases

- Dedicated Nodes -> if we want to reserve a node for a certain subset of users, we can use taints and tolerations
- Specific hardware -> if certain apps require certain hardware, we can reserve a given node for those applications
- Ex: https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/#example-use-cases
