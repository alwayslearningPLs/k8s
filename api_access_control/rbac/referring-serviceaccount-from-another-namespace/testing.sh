#!/bin/bash

kubectl auth can-i get pods -n test2 --as=system:serviceaccount:test1:app1