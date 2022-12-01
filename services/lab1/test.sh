#!/bin/bash

sed 's/PORT/9876/g' nginx.yaml | kubectl apply -f-

podIP=$(kubectl get pods/nginx-web -n test -o jsonpath='{.status.podIP}')

sed "s#POD_IP#$podIP#" ./manifest.yaml | kubectl apply -f-