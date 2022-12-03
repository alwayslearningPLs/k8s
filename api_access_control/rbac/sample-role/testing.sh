#!/bin/bash

kubectl apply -f ./manifest.yaml

# Answer is yes
kubectl auth can-i get pods -n test --as=system:serviceaccount:test:app1

# Answer is no
kubectl auth can-i get pods -n default --as=system:serviceaccount:test:app1

# Successful response
kubectl get pods --as=system:serviceaccount:test:app1 -n test

kubectl get services --as=system:serviceaccount:test:app1 -n test