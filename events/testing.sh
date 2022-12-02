#!/bin/bash

NS=${1:-test}

# The type of the event can be: Normal(the least important when troubleshooting), Information, Warning
kubectl get events -n ${NS} --field-selector type!=Normal

# involvedObject.(kind|name|namespace)
kubectl get events -n ${NS} --field-selector involvedObject.kind=Pod

kubectl get events -n ${NS} --field-selector involvedObject.name=name-of-the-resource