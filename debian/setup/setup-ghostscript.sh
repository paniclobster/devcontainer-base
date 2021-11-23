#!/usr/bin/env bash

set -ex

# Install Ghostscript
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        ghostscript \
    && sudo rm -rf /var/lib/apt/lists/*
