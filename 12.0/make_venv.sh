#!/usr/bin/env sh
set -xe

PYTHON=~/.pyenv/versions/3.5.10/bin/python3
D=$PWD

cd $1
$PYTHON -m venv venv
. venv/bin/activate
$PYTHON -m pip install -r $D/common/odoo/odoo/requirements.txt
$PYTHON -m pip install -e $D/common/odoo/odoo
