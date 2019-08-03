#!/bin/bash
echo "--- Untaint master node ---"
kubectl taint nodes --all node-role.kubernetes.io/master-
echo "--- FINISHED Untaint master node ---"
