#!/bin/bash
echo "Runnin Setup wrapper"

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/install-k8s-master.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/untaint-master-node.sh | bash 

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/install-nginx-ingress.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/deploy-metrics-server.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/create-namespaces.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/deploy-guestbook.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/deploy-frontend-ingress.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/deploy-autoscaler.sh | bash

sudo wget -O - https://raw.githubusercontent.com/erikrapcik/devops-mstakx/master/level1/scripts/test-autoscaling.sh | bash
