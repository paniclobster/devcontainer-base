#!/usr/bin/env bash

set -e

# Install python3
sudo apk add --no-cache \
    python3

# Install pip
curl  https://bootstrap.pypa.io/get-pip.py | sudo python3

# Make symlinks that are expected to exist
sudo ln -s /usr/bin/pydoc3 /usr/bin/pydoc
sudo ln -s /usr/bin/python3 /usr/bin/python
