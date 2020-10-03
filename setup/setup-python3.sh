#!/usr/bin/env bash

set -e

# Install python3
sudo apk add --no-cache \
    python3

# Install pip
curl  https://bootstrap.pypa.io/get-pip.py | sudo python3
