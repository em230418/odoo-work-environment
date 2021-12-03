#!/usr/bin/env sh
set -xe

cd $1
python3 -m venv venv --prompt $1
. venv/bin/activate
python3 -m pip install -r common/odoo/odoo/requirements.txt
python3 -m pip install -e common/odoo/odoo
