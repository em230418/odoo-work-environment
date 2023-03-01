#!/usr/bin/env sh
git clone -b 16.0 --single-branch -o upstream https://github.com/em230418/odoo-project-template.git $@
cd $@
git remote add origin git@github.com:em230418/odoo-project-template.git
