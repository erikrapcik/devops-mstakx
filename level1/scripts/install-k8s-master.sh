echo "--- Install K8s Master node ---"; echo

echo "Disable swap until next reboot"; echo 
sudo swapoff -a
echo

echo "Update the local node"; echo
sudo apt-get update && sudo apt-get upgrade -y
echo

echo "Install Docker"; echo
sudo apt-get install -y docker.io
echo

echo "Installing kubeadm, kubelet and kubectl"; echo 
sudo apt-get update && apt-get install -y apt-transport-https curl

sudo sh -c "echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' >> /etc/apt/sources.list.d/kubernetes.list"

sudo sh -c "curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -"

sudo apt-get update
sudo apt-get install -y kubeadm=1.14.1-00 kubelet=1.14.1-00 kubectl=1.14.1-00
sudo apt-mark hold kubelet kubeadm kubectl
echo 


echo "Run kubeadm"; echo
sudo kubeadm init --kubernetes-version 1.14.1 --pod-network-cidr 192.168.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "Installing a pod network add-on (Calico)"; echo
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml

echo "--- FINISHED Install K8s Master node ---"; echo


