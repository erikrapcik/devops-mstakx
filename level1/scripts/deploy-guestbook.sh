#!/bin/bash
echo "--- Deploy Guestbook application ---"


echo "Apply Redis master deployment"
sudo kubectl apply -n staging -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml
sudo kubectl apply -n production -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml

echo "Apply Redis master service"
kubectl apply -n staging -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml
kubectl apply -n production -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml

echo "Apply Redis slave deployment"
kubectl apply -n staging -f https://k8s.io/examples/application/guestbook/redis-slave-deployment.yaml
kubectl apply -n production -f https://k8s.io/examples/application/guestbook/redis-slave-deployment.yaml

echo "Apply Redis slave service"
kubectl apply -n staging -f https://k8s.io/examples/application/guestbook/redis-slave-service.yaml
kubectl apply -n production -f https://k8s.io/examples/application/guestbook/redis-slave-service.yaml

echo "Apply the frontend Deployment"
kubectl apply -n staging -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml
kubectl apply -n production -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml

echo "Apply the frontend Service"
kubectl apply -n staging -f https://k8s.io/examples/application/guestbook/frontend-service.yaml
kubectl apply -n production -f https://k8s.io/examples/application/guestbook/frontend-service.yaml

