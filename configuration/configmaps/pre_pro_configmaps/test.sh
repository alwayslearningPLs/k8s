#!/bin/bash

NS=pre
PORT=80

if [[ $NS -eq pro ]]; then PORT=90; fi

sed "s#NS#${NS}#g" ./manifest.yaml | kubectl apply -f-

kubectl run client --image alpine:3.16 --rm --tty -i -n ${NS} -- /bin/sh -c "apk add curl; curl http://nginx.${NS}.svc.cluster.local.:${PORT}/;"

kubectl delete ns pre pro