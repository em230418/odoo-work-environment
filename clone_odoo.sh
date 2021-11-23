#!/usr/bin/env sh
set -xe

cd "$(dirname "$0")"

WD=$PWD
V=$1
MASTER_DIR=$PWD/odoo-master-bare

if [ -d "$MASTER_DIR" ]; then
    # подтягиваем последние обновления с master ветки
    cd $MASTER_DIR
    git fetch
    cd $WD
else
    # создаем "голый" репозиторий odoo с ветки master
    # требуется для того, чтобы репозитории с рабочими веткам (15.0, 14.0 и т.д)
    # 1. клонировались быстрее
    # 2. не занимали избыточное место на диске
    git clone https://github.com/odoo/odoo.git -b master --single-branch --bare $MASTER_DIR
fi

GIT_PARAMS="-o upstream --single-branch -b $V --reference $MASTER_DIR"

mkdir -p $V/common/odoo
cd $V/common/odoo

if [ -d "odoo" ]; then
    cd odoo
    git pull
    cd ..
else
    git clone https://github.com/odoo/odoo.git $GIT_PARAMS
fi

cd ../../..
