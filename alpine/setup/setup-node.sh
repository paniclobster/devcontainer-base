#!/usr/bin/env bash

set -ex

# Install nodejs, nodejs-npm
sudo apk add --no-cache \
    nodejs-current \
    nodejs-npm
