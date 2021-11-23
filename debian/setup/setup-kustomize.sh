#!/usr/bin/env bash

set -ex

# Install Kustomize
KUSTOMIZE_INSTALL_VERSION=${KUSTOMIZE_VERSION:-master}
curl --location --silent "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/${KUSTOMIZE_INSTALL_VERSION}/hack/install_kustomize.sh" | sudo bash
sudo install kustomize /usr/local/bin/
sudo rm ./kustomize
