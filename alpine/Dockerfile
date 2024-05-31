# Base image
FROM mcr.microsoft.com/vscode/devcontainers/base:alpine-3.20

# Exit immediately if a command exits with a non-zero status
RUN set -ex

# Update base dependencies
RUN apk del --no-cache \
    zsh \
  && apk upgrade --no-cache \
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

# Disable __bash_prompt
RUN sed --in-place '/^__bash_prompt$/d' /home/$DEVCONTAINER_USERNAME/.bashrc

# Remove oh-my-zsh settings
RUN rm --recursive \
  /home/$DEVCONTAINER_USERNAME/.oh-my-zsh \
  /home/$DEVCONTAINER_USERNAME/.zshrc
