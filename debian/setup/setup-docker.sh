#!/usr/bin/env bash

set -ex

# Install docker
curl --location --silent "https://get.docker.com" | sudo bash -

# Install socat
sudo apt-get update \
    && sudo apt-get install --assume-yes \
        procps \
        socat \
    && sudo rm -rf /var/lib/apt/lists/*

# Grant docker access to user
sudo usermod --append --groups docker $DEVCONTAINER_USERNAME

# Configure docker socket
DOCKER_HOST_SOCKET="/var/run/docker-host.sock"
DOCKER_SOCKET="/var/run/docker.sock"

sudo tee "${DEVCONTAINER_SETUP_DIR}/setup-docker-init.sh" >>/dev/null \
    <<EOF
#!/usr/bin/env bash

set -e

SOCAT_PATH_BASE=/tmp/vscr-dind-socat
SOCAT_LOG=\${SOCAT_PATH_BASE}.log
SOCAT_PID=\${SOCAT_PATH_BASE}.pid

if [ ! -f "\${SOCAT_PID}" ] || ! ps -p \$(cat \${SOCAT_PID}) > /dev/null; then
    (sudo socat UNIX-LISTEN:${DOCKER_SOCKET},fork,mode=660,user=${DEVCONTAINER_USERNAME} UNIX-CONNECT:${DOCKER_HOST_SOCKET} 2>&1 | sudo tee -a \${SOCAT_LOG} > /dev/null & echo "\$!" | sudo tee \${SOCAT_PID} > /dev/null)
fi
EOF

sudo chmod +x "${DEVCONTAINER_SETUP_DIR}/setup-docker-init.sh"
sudo chown ${DEVCONTAINER_USERNAME}:root "${DEVCONTAINER_SETUP_DIR}/setup-docker-init.sh"

echo "${DEVCONTAINER_SETUP_DIR}/setup-docker-init.sh" | sudo tee -a /root/.bashrc >>/home/${DEVCONTAINER_USERNAME}/.bashrc
chown ${DEVCONTAINER_USERNAME} /home/${DEVCONTAINER_USERNAME}/.bashrc
