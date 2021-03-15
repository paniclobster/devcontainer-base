#!/usr/bin/env bash

set -e

# Install Ghostscript
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        ghostscript \
    && sudo rm -rf /var/lib/apt/lists/*
