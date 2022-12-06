#!/bin/bash

kubectl delete svc/prometheus deployment/prometheus serviceaccount/prometheus configmap/prometheus -n monitoring

kubectl delete clusterrole/prometheus clusterrolebinding/prometheus