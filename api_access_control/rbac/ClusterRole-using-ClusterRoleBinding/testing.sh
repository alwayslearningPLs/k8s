#!/bin/bash

namespaces=(test1 test2 test3)

for i in ${namespaces[@]}; do
  echo "Using namespace ${i}"
  kubectl get pods --as=system:serviceaccount:test1:app1
  kubectl auth can-i get pods -n ${i} --as=system:serviceaccount:test1:app1
done
