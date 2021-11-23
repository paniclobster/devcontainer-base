#!/usr/bin/env bash

set -e

if [ ! -f "${DEVCONTAINER_SETUP_DIR}/setup-${1}.log" ]; then
    exec "${DEVCONTAINER_SETUP_DIR}/setup-${1}.sh" ${@:2} 2>&1 | sudo tee "${DEVCONTAINER_SETUP_DIR}/setup-${1}.log"
fi
