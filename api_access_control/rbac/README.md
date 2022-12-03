# RBAC

RBAC stands for Role Base Access Control.

## Useful commands

`kubectl api-resources --verbs=list --namespaced` and if you want to print only the name of each resource, use `-o name` option.

`kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -l <name>=<value> -n <namespace>`

## Is it enabled?

You can check the configuration file `/etc/kubernetes/manifest` on your master node(s) or the kubernetes API server pod, and make sure it contains the flag: `--authorization-node=Node,RBAC`

## Some verbs that we use on RBAC

- get
- list
- create
- watch
- delete
- patch
