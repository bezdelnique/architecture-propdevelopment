#!/usr/bin/bash



cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-frontend-to-backend
spec:
  podSelector:
    matchLabels:
      role: back-end-api          # Protect this pod
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              role: front-end     # Only this can connect
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-admin-frontend-to-admin-backend
spec:
  podSelector:
    matchLabels:
      role: admin-back-end-api    # Protect this pod
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              role: admin-front-end  # Only this can connect
EOF
