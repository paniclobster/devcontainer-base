# Base image
FROM alpine:3.12.0

# Exit immediately if a command exits with a non-zero status
RUN set -e

# Install bash
RUN apk add --no-cache \
    bash
ENV PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Install base dependencies
RUN apk add --no-cache \
    curl \
    git \
    openssh \
    openssl \
    sudo

# Create vscode user
ARG DEVCONTAINER_USERNAME=vscode
ENV DEVCONTAINER_USERNAME=$DEVCONTAINER_USERNAME
ARG GROUPNAME=$DEVCONTAINER_USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN addgroup \
    --gid $USER_GID \
    $GROUPNAME \
  && adduser \
    --disabled-password \
    --gecos $DEVCONTAINER_USERNAME \
    --home /home/$DEVCONTAINER_USERNAME \
    --ingroup $GROUPNAME \
    --shell /bin/ash \
    --uid $USER_UID \
    $DEVCONTAINER_USERNAME \
  && echo $DEVCONTAINER_USERNAME ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/$DEVCONTAINER_USERNAME \
  && chmod 0440 /etc/sudoers.d/$DEVCONTAINER_USERNAME

# Create vscode server folders
RUN mkdir -p \
    /home/$DEVCONTAINER_USERNAME/.vscode-server/extensions \
    /home/$DEVCONTAINER_USERNAME/.vscode-server-insiders/extensions \
  && chown -R $DEVCONTAINER_USERNAME \
    /home/$DEVCONTAINER_USERNAME/.vscode-server \
    /home/$DEVCONTAINER_USERNAME/.vscode-server-insiders

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
