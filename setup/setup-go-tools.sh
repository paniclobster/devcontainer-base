#!/usr/bin/env bash

set -e

# Install Go tools
export GOPATH=${DOCKER_GO_PATH}
go get -x -d github.com/stamblerre/gocode
go build -o gocode-gomod github.com/stamblerre/gocode
mv gocode-gomod "${GOPATH}/bin/"
go get -u -v \
    github.com/acroca/go-symbols \
    github.com/cweill/gotests/... \
    github.com/davidrjenni/reftools/cmd/fillstruct \
    github.com/fatih/gomodifytags \
    github.com/go-delve/delve/cmd/dlv \
    github.com/godoctor/godoctor \
    github.com/haya14busa/goplay/cmd/goplay \
    github.com/josharian/impl \
    github.com/mdempsky/gocode \
    github.com/ramya-rao-a/go-outline \
    github.com/rogpeppe/godef \
    github.com/sqs/goreturns \
    github.com/stamblerre/gocode \
    github.com/uudashr/gopkgs/v2/cmd/gopkgs \
    github.com/uudashr/gopkgs/v2/cmd/gopkgs \
    golang.org/x/lint/golint \
    golang.org/x/tools/cmd/goimports \
    golang.org/x/tools/cmd/gorename \
    golang.org/x/tools/cmd/guru
