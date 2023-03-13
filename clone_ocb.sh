#!/usr/bin/env sh
set -xe

cd "$(dirname "$0")"

WD=$PWD
V=$1
MASTER_DIR=$PWD/odoo-master-bare
ODOO_DIR=$PWD/$V/common/odoo/odoo

./clone_odoo.sh $@

GIT_PARAMS="-o upstream --single-branch -b $V --reference $MASTER_DIR --reference $ODOO_DIR"

mkdir -p $V/common/OCA
cd $V/common/OCA

if [ -d "OCB" ]; then
    cd OCB
    git pull
    cd ..
else
    git clone https://github.com/OCA/OCB.git $GIT_PARAMS
fi

cd ../../..
