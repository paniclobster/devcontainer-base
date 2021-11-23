#!/usr/bin/env bash

set -ex

# Install Minikube
MINIKUBE_INSTALL_VERSION=${MINIKUBE_VERSION:-latest}
curl --location --output minikube --silent "https://storage.googleapis.com/minikube/releases/${MINIKUBE_INSTALL_VERSION}/minikube-linux-amd64"
sudo install minikube /usr/local/bin/
sudo rm ./minikube
