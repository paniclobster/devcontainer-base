#!/usr/bin/env bash

set -e

# Install Go
sudo apk add --no-cache \
    go

# Configure GOPATH
export GOPATH=${DOCKER_GO_PATH}
echo "export GOPATH=${GOPATH}" | tee -a /home/${DEVCONTAINER_USERNAME}/.bashrc >>/dev/null

sudo mkdir -p "${GOPATH}/bin" "${GOPATH}/src"
sudo chmod -R 777 "${GOPATH}"
