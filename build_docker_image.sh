#!/usr/bin/env sh
set -xe

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

V=$1

cd $V/docker
docker build . -t my/odoo:$V
cd ../..
