#!/bin/bash

kubectl create namespace z2
kubectl apply -f service.yaml -n z2
#kubectl apply -f secret.yaml -n z2
kubectl apply -f statefulset.yaml -n z2
kubectl apply -f deployment.yaml -n z2
