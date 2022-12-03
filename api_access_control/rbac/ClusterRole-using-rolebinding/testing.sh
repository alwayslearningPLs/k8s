#!/bin/bash

kubectl get pods -n test2 --as=system:serviceaccount:test1:app1

kubectl auth can-i get pods -n test2 --as=system:serviceaccount:test1:app1
