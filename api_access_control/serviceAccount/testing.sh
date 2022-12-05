#!/bin/bash

API_SERVER=$(kubectl config view -o jsonpath='{.clusters[*].cluster.server}')

sed "s#\$API_SERVER#$API_SERVER#" ./manifest.yaml | kubectl apply -f-