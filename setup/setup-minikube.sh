#!/usr/bin/env bash

set -e

# Install Minikube
curl --location --output minikube --silent "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
sudo install minikube /usr/local/bin/
sudo rm ./minikube
