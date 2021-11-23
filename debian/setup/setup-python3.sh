#!/usr/bin/env bash

set -ex

# Install python2
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        python3 \
        python3-distutils \
    && sudo rm -rf /var/lib/apt/lists/*

# Install pip
curl https://bootstrap.pypa.io/get-pip.py | sudo python3
