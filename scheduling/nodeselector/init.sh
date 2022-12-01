#!/bin/bash
# Help:
#   - https://www.giantswarm.io/blog/securing-the-configuration-of-kubernetes-cluster-components
#   - https://kubernetes.io/docs/reference/access-authn-authz/node/
# How to know that we are using the NodeRestriction plugin?
# Connect to the control-plane and execute `ps -ef | grep kube-apiserver` and if we have set the parameter "--enable-admission-plugins" with the value NodeRestriction, then it is enabled.
# By default, NodeRestriction is not set

NODE_NAME=

kubectl get nodes --show-labels

kubectl label nodes ${NODE_NAME} node-restriction.kubernetes.io/whatever=sure

kubectl apply -f ./nodeselector-pod.yaml