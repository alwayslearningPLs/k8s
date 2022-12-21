#!/bin/bash
#

random_chars=$(openssl rand -base64 755 | tr --delete "\n" | tr --delete " ")

sed "s@\$keyFile@$random_chars@g" ./kubernetes-deployment.yaml | kubectl apply -f-

