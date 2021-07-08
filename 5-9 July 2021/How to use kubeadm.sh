# First you need to know your public IP address. You can use ifconfig
# In my case, my server's IP address is 134.209.240.38

# Create the first control-plane
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=134.209.240.38 --control-plane-endpoint=134.209.240.38

# Connect kubectl to cluster created
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# I am using Calico as my pod network. Another options: https://kubernetes.io/docs/concepts/cluster-administration/addons/
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml



# From other machines
#  Add new control-planes 
 kubeadm join 134.209.240.38:6443 --token 80uh3x.84dbvtf6ir1c12af \
        --discovery-token-ca-cert-hash sha256:c004f01df5474d1129fb5d061a42d969f035441bd4a25753c0b6774b5fbf6b9c \
        --control-plane

# Add new worker nodes
kubeadm join 134.209.240.38:6443 --token 80uh3x.84dbvtf6ir1c12af \
        --discovery-token-ca-cert-hash sha256:c004f01df5474d1129fb5d061a42d969f035441bd4a25753c0b6774b5fbf6b9c