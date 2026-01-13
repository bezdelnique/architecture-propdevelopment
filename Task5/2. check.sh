#!/usr/bin/bash

kubectl exec -it front-end-app -- curl -m 3 http://admin-back-end-api-app
kubectl exec -it admin-front-end-app -- curl -m 3 http://back-end-api-app

kubectl exec -it front-end-app -- curl http://back-end-api-app
kubectl exec -it admin-front-end-app -- curl http://admin-back-end-api-app


