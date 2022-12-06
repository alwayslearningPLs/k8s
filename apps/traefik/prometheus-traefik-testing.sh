#!/bin/bash

kubectl run client --image alpine:3.16 --tty -i -n kube-system \
  --rm -- /bin/sh -c "apk add curl; curl http://traefik-prometheus.kube-system.svc.cluster.local.:9100/metrics"