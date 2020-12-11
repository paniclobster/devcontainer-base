#!/usr/bin/env bash

set -e

# Install Helm
wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
