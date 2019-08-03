#!/bin/bash
echo "--- Create K8s namespace staging and production ---"; echo

sudo kubectl create namespace staging
sudo kubectl create namespace production

echo "--- FINISHED Create K8s namespace staging and production ---"; echo


