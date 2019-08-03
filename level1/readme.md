# Home test for DevOps/SysOps role – Level#1
This project creates the simplest one node cluster on GCP. 
The project is base on tasks at https://drive.google.com/file/d/1DszScyfTEDLCdhzhtu1MdRg0zqW1qRE2/view.

Terraform is used to provision GCP infrastructure, upload and execute shell file which solve all tasks.

## Steps
### Clone this repository
- change working directory to leve11 directory
```terminal
$ cd devops-mstakx/level1 
```
later reffered as PROJECT_DIR

### Create GCP project
- name: mStakx-level1

### Create GCP Service Account

- Go to https://console.cloud.google.com
- Navigate IAM & Admin > Service Accounts, and click Create Service Account
- Set Service account name: terraform and click create
- Assign Project - Editor role and confirm
- Click Create key - Key type: JSON and click Create
- Copy downloaded json file to PROJECT_DIR/creds/serviceaccount.json
- Back in GCP console click Done

### Install Terraform
- download from terraform.io
- unzip downloaded file and add it to your PATH variable

### Enable GCP API

### Run Terraform
In PROJECT_DIR run shell comands:
```terminal
$ terraform init
$ terraform apply
```

## Answers to questions:
- What was the node size chosen for the Kubernetes nodes? And why?
n1-highcpu-4 - minimal solution to fullfill this cluster requirements

- What method was chosen to install the demo application and ingress controller on the cluster, justify the
method used
deployed as kubernetes API objects

- What would be your chosen solution to monitor the application on the cluster and why?
Prometheus -> Number one tool for monitoring containerized environment

- What additional components / plugins would you install on the cluster to manage it better?
Prometheus, Grafana, Elasticsearch, Filebeat
