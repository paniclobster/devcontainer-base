#!/usr/bin/env bash

set -e

# Install Skaffold
curl --location --output skaffold --silent "https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64"
sudo install skaffold /usr/local/bin/
sudo rm ./skaffold
