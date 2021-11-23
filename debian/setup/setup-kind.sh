#!/usr/bin/env bash

set -ex

# Install kind
curl --silent "https://api.github.com/repos/kubernetes-sigs/kind/releases" | grep browser_download | grep linux | cut -d '"' -f 4 | grep amd64 | sort | tail -n 1 | xargs curl --location --output kind --silent
sudo install kind /usr/local/bin/
sudo rm ./kind
