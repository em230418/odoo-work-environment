#!/usr/bin/env sh
set -xe

for V in $@
do
    cd $V

    cd docker
    docker build . -t my/odoo:$V
    cd ..

    cd ..  # $V
done
