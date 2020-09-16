#!/usr/bin/env bash

set -e

# Install Kustomize
curl --location --silent "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | sudo bash
sudo install kustomize /usr/local/bin/
sudo rm ./kustomize
