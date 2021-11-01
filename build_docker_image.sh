#!/usr/bin/env sh
set -xe

V=$1

cd $V/docker
docker build . -t my/odoo:$V
cd ../..
