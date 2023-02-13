ARG BASE_IMAGE=ghcr.io/paniclobster/devcontainer-base:test-alpine
FROM $BASE_IMAGE

# Test Alpine SDK
RUN devcontainer-setup alpine-sdk

# Test Dapr CLI
RUN devcontainer-setup dapr-cli

# Test Ghostscript
RUN devcontainer-setup ghostscript

# Test Go
RUN devcontainer-setup go
RUN devcontainer-setup go-tools

# Test ImageMagick
RUN devcontainer-setup imagemagick

# Test Kubernetes tools
RUN devcontainer-setup kubernetes
RUN devcontainer-setup helm
RUN devcontainer-setup kustomize
RUN devcontainer-setup minikube
RUN devcontainer-setup kind
RUN devcontainer-setup skaffold
RUN devcontainer-setup tilt

# Test Node.js
RUN devcontainer-setup node

# Test Packer
RUN devcontainer-setup packer

# Test Python 2
RUN devcontainer-setup python2

# Test Python 3
RUN devcontainer-setup python3
