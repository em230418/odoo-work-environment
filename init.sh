#!/usr/bin/env sh
set -xe

# TODO: надо по-хорошему историю сохранять, а не обрезать с помощью depth 1
for V in 14.0 #12.0 13.0 14.0
do
    GIT_PARAMS="-o upstream --single-branch -b $V --depth 1"

    mkdir $V
    cd $V

    mkdir -p common
    cd common

    mkdir -p odoo
    cd odoo
    git clone https://github.com/odoo/odoo.git $GIT_PARAMS
    cd ..

    cd ..  # common

    cd docker
    docker build . -t my/odoo:$V
    cd ..

    cd ..  # $V
done
