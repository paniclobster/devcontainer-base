#!/usr/bin/env bash

set -e

# Install ImageMagick
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        imagemagick \
    && sudo rm -rf /var/lib/apt/lists/*
