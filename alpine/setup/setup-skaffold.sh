#!/usr/bin/env bash

set -e

# Install Skaffold
SKAFFOLD_INSTALL_VERSION=${SKAFFOLD_VERSION:-latest}
curl --location --output skaffold --silent "https://storage.googleapis.com/skaffold/releases/${SKAFFOLD_INSTALL_VERSION}/skaffold-linux-amd64"
sudo install skaffold /usr/local/bin/
sudo rm ./skaffold
