#!/bin/bash

kubectl port-forward svc/grafana -n test 3000:3000