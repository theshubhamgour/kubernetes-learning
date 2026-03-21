#!/bin/bash

echo "===== Kubernetes MASTER Verification Script ====="

echo ""
echo "1. Checking kubelet status..."
sudo systemctl is-active kubelet

echo ""
echo "2. Checking containerd status..."
sudo systemctl is-active containerd

echo ""
echo "3. Checking Kubernetes components (pods)..."
kubectl get pods -A

echo ""
echo "4. Checking nodes..."
kubectl get nodes

echo ""
echo "5. Checking control plane components..."
kubectl get pods -n kube-system | grep -E 'kube-apiserver|kube-controller-manager|kube-scheduler|etcd'

echo ""
echo "6. Checking CoreDNS..."
kubectl get pods -n kube-system | grep coredns

echo ""
echo "7. Checking Calico (network plugin)..."
kubectl get pods -n kube-system | grep calico

echo ""
echo "8. Checking cluster info..."
kubectl cluster-info

echo ""
echo "===== VERIFICATION COMPLETE ====="
echo "If all components are Running and node is Ready → SUCCESS ✅"
