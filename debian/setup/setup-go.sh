#!/usr/bin/env bash

set -e

# Install go
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        golang
    && sudo rm -rf /var/lib/apt/lists/*

# Configure GOPATH
export GOPATH=${DOCKER_GO_PATH}
echo "export GOPATH=${GOPATH}" | tee -a /home/${DEVCONTAINER_USERNAME}/.bashrc >>/dev/null

sudo mkdir -p "${GOPATH}/bin" "${GOPATH}/src"
sudo chmod -R 777 "${GOPATH}"
