#!/usr/bin/env sh
set -xe

# TODO: надо по-хорошему историю сохранять, а не обрезать с помощью depth 1
for V in $@
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

    mkdir -p OCA
    cd OCA
    git clone https://github.com/OCA/contract.git $GIT_PARAMS
    git clone https://github.com/OCA/queue.git $GIT_PARAMS
    git clone https://github.com/OCA/web.git $GIT_PARAMS
    cd ..

    mkdir -p itpp-labs
    cd itpp-labs
    git clone https://github.com/itpp-labs/access-addons.git $GIT_PARAMS
    cd ..

    cd ..  # common

    cd docker
    docker build . -t my/odoo:$V
    cd ..

    cd ..  # $V
done
