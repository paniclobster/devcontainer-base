#!/usr/bin/env bash

set -ex

# Install nodejs, nodejs-npm
curl --location --silent "https://deb.nodesource.com/setup_14.x" | sudo bash -
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        nodejs \
    && sudo rm -rf /var/lib/apt/lists/*
