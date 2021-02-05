#!/usr/bin/env bash

set -e

# Install python3
sudo apk add --no-cache \
    python3

# Install pip
curl  https://bootstrap.pypa.io/get-pip.py | sudo python3

# Make symlinks that are expected to exist
sudo ln -s /usr/local/bin/idle3 /usr/local/bin/idle
sudo ln -s /usr/local/bin/pydoc3 /usr/local/bin/pydoc
sudo ln -s /usr/local/bin/python3 /usr/local/bin/python
sudo ln -s /usr/local/bin/python3-config /usr/local/bin/python-config
