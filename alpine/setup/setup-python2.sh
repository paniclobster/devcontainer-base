#!/usr/bin/env bash

set -e

# Install python2
sudo apk add --no-cache \
    python2

# Install pip
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | sudo python2
