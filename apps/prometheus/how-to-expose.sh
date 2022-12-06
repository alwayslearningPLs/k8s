#!/bin/bash
# Don't execute this script

# Port forwarding directly from pod to outside
kubectl port-forward $(kubectl get pods -l='app.kubernetes.io/name=prometheus-server' -o=name -n monitoring) 9090:9090 -n monitoring

# We can also uso a NodePort service to expose our service in the InternalIP of our node
cat <<EOF | kubectl apply -f-
---
apiVersion: v1
kind: Service
metadata:
  name: prometheus
  namespace: monitoring
  labels:
    app.kubernetes.io/name: prometheus-svc
    app.kubernetes.io/part-of: observability
  annotations:
    prometheus.io/scrape: 'true'
    prometheus.io/port:   '9090'
spec:
  selector: 
    app.kubernetes.io/name: prometheus-server
    app.kubernetes.io/part-of: observability
  type: NodePort  
  ports:
    - port: 9090
      targetPort: web
      nodePort: 30000
EOF

# We can use an ingress object of our Reverse proxy (in my case, it will be traefik)
