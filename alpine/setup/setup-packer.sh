#!/usr/bin/env bash

set -ex

# Install packer
PACKER_INSTALL_VERSION=$(curl --location --silent "https://checkpoint-api.hashicorp.com/v1/check/packer" | jq -r ".current_version")
curl --location --output packer.zip --silent "https://releases.hashicorp.com/packer/${PACKER_INSTALL_VERSION}/packer_${PACKER_INSTALL_VERSION}_linux_amd64.zip"
unzip packer.zip
sudo install packer /usr/local/bin/
sudo rm ./packer ./packer.zip
