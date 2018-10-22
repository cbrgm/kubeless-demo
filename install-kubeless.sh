#!/bin/bash

set -eou

echo "Installing Kubeless to cluster..."
export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4)
kubectl create ns kubeless
kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml

sleep 10
echo "Check if controller, deployments and crds are up..."
kubectl get pods -n kubeless
kubectl get deployment -n kubeless
kubectl get customresourcedefinition
