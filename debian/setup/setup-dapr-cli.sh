#!/usr/bin/env bash

set -ex

# Install Dapr CLI
DAPR_CLI_INSTALL_VERSION=${DAPR_CLI_VERSION:-master}
curl --location --silent "https://raw.githubusercontent.com/dapr/cli/${DAPR_CLI_INSTALL_VERSION}/install/install.sh" | sudo bash -
