#!/usr/bin/env bash

set -e

# Create vscode server folders
sudo mkdir -p \
    /home/$DEVCONTAINER_USERNAME/.vscode-server/extensions \
    /home/$DEVCONTAINER_USERNAME/.vscode-server-insiders/extensions

sudo chown -R $DEVCONTAINER_USERNAME \
    /home/$DEVCONTAINER_USERNAME/.vscode-server \
    /home/$DEVCONTAINER_USERNAME/.vscode-server-insiders
