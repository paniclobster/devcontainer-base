#!/usr/bin/env bash

set -e

# Install python3
sudo apk add --no-cache \
    python3

# Install pip
curl  https://bootstrap.pypa.io/get-pip.py | sudo python3

# Make symlinks that are expected to exist
sudo ln -s /usr/local/binidle3 /usr/local/binidle
sudo ln -s /usr/local/binpydoc3 /usr/local/binpydoc
sudo ln -s /usr/local/binpython3 /usr/local/binpython
sudo ln -s /usr/local/binpython3-config /usr/local/binpython-config
