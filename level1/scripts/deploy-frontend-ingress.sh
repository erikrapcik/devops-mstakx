#!/bin/bash
echo "--- Deploy frontend ingress ---"
sudo kubectl apply -f https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/k8s/ingress-frontend-production.yaml
sudo kubectl apply -f https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/k8s/ingress-frontend-staging.yaml
echo "--- FINISHED Deploy frontend ingress ---"
