#!/bin/bash

# If we don't specify the nodeName and we don't have a kube-scheduler working on the kubernetes cluster, we have to create
# a binding Object:

cat <<EOF
apiVersion: v1
kind: Binding
metadata:
  name: nginx
target:
  apiVersion: v1
  kind: Node
  name: NODE_NAME
EOF