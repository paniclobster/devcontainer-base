#!/usr/bin/env bash

set -ex

# Install VS Code Live Share dependencies
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        desktop-file-utils \
        gnome-keyring \
        libicu63 \
        libkrb5-3 \
        libsecret-1-0 \
        libssl1.1 \
        x11-utils \
        zlib1g \
    && sudo rm -rf /var/lib/apt/lists/*
