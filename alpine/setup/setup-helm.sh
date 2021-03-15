#!/usr/bin/env bash

set -e

# Install Helm
HELM_INSTALL_VERSION=${HELM_VERSION:-master}
curl --location --silent "https://raw.githubusercontent.com/helm/helm/${HELM_INSTALL_VERSION}/scripts/get-helm-3" | sudo bash -
