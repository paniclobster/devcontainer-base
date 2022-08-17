#!/usr/bin/env bash

set -ex

# Install ImageMagick
sudo apk add --no-cache \
    imagemagick \
    imagemagick-dev
