#!/bin/bash

# Kubernetes only outputs once
kubectl get events -n test --field-selector='reason=Unhealthy,involvedObject.name=dumb-process'

kubectl get events -n test --field-selector='reason=Unhealthy,involvedObject.name=dumb-process' \
  --field-selector='reason=Killing,involvedObject.name=dumb-process'