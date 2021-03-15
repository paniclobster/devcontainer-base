#!/usr/bin/env bash

set -e

# Install python2
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        python2 \
    && sudo rm -rf /var/lib/apt/lists/*

# Install pip
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | sudo python2
