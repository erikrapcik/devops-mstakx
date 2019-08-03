#!/bin/bash

echo; echo; echo; echo; echo;
echo "--- Test Autoscaling on Production ---"

echo "Waining for Metrics srver and HPA to bea ready"

while true; do
	hpa_state=$(sudo kubectl get hpa -n production frontend)
	not_ready="unknown"

	if [[ "$hpa_state" =~ $not_ready ]]; then
        	echo "HPA is not ready yet. Waining 30 seconds..."
		sleep 30
	else
        	echo "HPA is ready now."
        	break
	fi

done

echo ; echo ; echo ;
echo "HPA state before load hit:"
sudo kubectl get hpa -n production frontend

echo ;
echo "Deploy load generator pod"
sudo kubectl apply -f https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/k8s/load-generator.yaml

for i in `seq 1 10`; do
  	sleep 30
	echo
  	echo "HPA state after $((i * 30)) seconds of load:"
	sudo kubectl get hpa -n production frontend
done

echo "Remove load generator pod"
sudo kubectl delete -f https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/k8s/load-generator.yaml

echo "--- FINISHED Test Autoscaling on Production ---"


