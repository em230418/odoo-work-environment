#!/usr/bin/env sh
set -xe

for V in $@
do
    cd $V/docker
    docker build . -t my/odoo:$V
    cd ../..
done
