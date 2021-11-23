#!/usr/bin/env bash

set -ex

# Install GPG key
curl --location --silent https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add repository
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install packer
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        packer \
    && sudo rm -rf /var/lib/apt/lists/*
