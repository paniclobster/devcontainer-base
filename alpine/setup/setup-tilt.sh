#!/usr/bin/env bash

set -ex

# Install tilt
curl --silent "https://api.github.com/repos/tilt-dev/tilt/releases" | grep browser_download | grep linux | cut -d '"' -f 4 | grep x86_64 | sort | tail -n 1 | xargs curl --location --output tilt.tar.gz --silent
tar -xvf tilt.tar.gz
sudo install tilt /usr/local/bin/
sudo rm ./tilt
sudo rm ./tilt.tar.gz
