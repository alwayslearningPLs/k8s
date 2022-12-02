#!/bin/bash
#
# List of recomended labels by kubernetes: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels

kubectl get nodes --show-labels

for node_name in $(kubectl get nodes -o jsonpath='{.items[*].metadata.name}'); do
  kubectl get nodes/${node_name} -o jsonpath='{.metadata.labels}' | jq .
done

cat <<EOF | kubectl apply -f-
---
apiVersion: v1
kind: Namespace
metadata:
  name: test
spec:
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx-web
  namespace: test
  labels:
    type: web
    environment: pre
spec:
  containers:
  - name: nginx-web
    image: nginx:1.22
    imagePullPolicy: IfNotPresent
    ports:
    - name: http
      containerPort: 80
      protocol: TCP
EOF

kubectl get pod/nginx-web -n test --show-labels

# You must specify the overwrite parameter in order to apply the change for a label that already exists.
kubectl label pod/nginx-web -n test environment=prod --overwrite

kubectl get pod/nginx-web -n test --show-labels

kubectl get pods -n test -l 'environment=prod'

kubectl delete pod/nginx-web -n test

## We are going to create a bunch of resources and try to delete them in an easy way
kubectl apply -f ./manifest.yaml
# We need to wait until the operations have succeded
sleep 10s
kubectl get svc,deployments,pods -l 'environment=des' -n test
kubectl delete deployment,services,statefulsets,pods -n test -l 'environment in (local,des)'