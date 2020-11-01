#!/usr/bin/env bash

set -e

# Install VS Code Live Share dependencies
sudo apk add --no-cache \
    desktop-file-utils \
    gnome-keyring \
    icu \
    krb5 \
    libsecret \
    openssl \
    xprop \
    zlib
