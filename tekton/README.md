## Tekton (WIP)

### What is tekton?
- Tekton is a cloud native CI/CD Solution
- Components of Tekton includes
    - pipelines
        - foundation of tekton -> able to run pipelines, more on this later
    - triggers
        - ways to trigger a pipeline, example like a GH commit happens -> run pipeline
    - CLI
        - cli to interact with tekton
    - operator
        - a way to install tekton into cluster
    - chain
        - a way to store artifacts built with pipelines

### Tekton pipelines
- Pipelines need a few different pieces to work together
- At a high level
    - `Task`: Can be one or multiple "steps"
    - `TaskRun`: An instance of a task - can be invoked on it's own, or apart of a `Pipeline`
    - `Pipeline`: Series of tasks - can be triggered by an event or invoked from a `PipelineRun`
    - `PipelineRun`: Invocation of pipeline resource


#### Installing
- install.sh will take you through installation
    