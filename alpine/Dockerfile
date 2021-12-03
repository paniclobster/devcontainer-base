# Base image
FROM mcr.microsoft.com/vscode/devcontainers/base:alpine-3.15

# Exit immediately if a command exits with a non-zero status
RUN set -ex

# Install base dependencies
RUN apk upgrade --no-cache \
  && apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    openssh \
    openssl \
    sudo \
    unzip

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
ARG DEVCONTAINER_USERNAME=vscode
ENV DEVCONTAINER_USERNAME=$DEVCONTAINER_USERNAME
USER $DEVCONTAINER_USERNAME
WORKDIR /home/$DEVCONTAINER_USERNAME
