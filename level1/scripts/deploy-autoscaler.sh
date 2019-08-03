echo "--- Deploy HPA (Autoscaler) ---"; echo
sudo kubectl create -n staging -f https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/k8s/hpa.yaml
sudo kubectl create -n production -f https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/k8s/hpa.yaml
echo "--- FINISHED Deploy HPA (Autoscaler) ---"; echo

