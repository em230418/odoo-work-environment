#!/usr/bin/env sh
set -xe

V=$@

GIT_PARAMS="-o upstream --single-branch -b $V --depth 1"

mkdir -p $V/common/odoo
cd $V/common/odoo

git clone https://github.com/odoo/odoo.git $GIT_PARAMS

cd ../../..
