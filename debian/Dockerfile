# Base image
FROM debian:buster-slim

# Exit immediately if a command exits with a non-zero status
RUN set -e

# Install base dependencies
RUN apt-get update \
  && apt-get install --assume-yes \
    curl \
    git \
    openssh-client \
    nano \
    sudo \
  && rm -rf /var/lib/apt/lists/*

# Create vscode user
ARG DEVCONTAINER_USERNAME=vscode
ENV DEVCONTAINER_USERNAME=$DEVCONTAINER_USERNAME
ARG GROUPNAME=$DEVCONTAINER_USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd \
    --gid $USER_GID \
    $GROUPNAME \
  && useradd \
    --create-home \
    --home-dir /home/$DEVCONTAINER_USERNAME \
    --gid $USER_GID \
    --shell /bin/bash \
    --uid $USER_UID \
    $DEVCONTAINER_USERNAME \
  && echo $DEVCONTAINER_USERNAME ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/$DEVCONTAINER_USERNAME \
  && chmod 0440 /etc/sudoers.d/$DEVCONTAINER_USERNAME

# Setup setup directory
ARG DEVCONTAINER_SETUP_DIR=/devcontainer/setup
ENV DEVCONTAINER_SETUP_DIR $DEVCONTAINER_SETUP_DIR
RUN mkdir -p \
    $DEVCONTAINER_SETUP_DIR
COPY ./setup/*.sh $DEVCONTAINER_SETUP_DIR/
RUN chmod +x $DEVCONTAINER_SETUP_DIR/*.sh

# Add setup runner script
COPY ./scripts/devcontainer-setup.sh /usr/local/bin/devcontainer-setup
RUN chmod +x /usr/local/bin/devcontainer-setup

# Set user and workdir
USER $DEVCONTAINER_USERNAME
WORKDIR /home/$DEVCONTAINER_USERNAME
