echo "--- Install Nginx Ingress controller ---"

# Mandatory Command is required for all deployments
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml

# Provider Specific Steps

## GCE-GKE
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml

echo "--- FINISHED Install Nginx Ingress controller ---"


