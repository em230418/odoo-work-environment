FROM odoo:10.0
MAINTAINER Eugene Molotov <molotov@it-projects.info>

USER root

RUN python -m pip install --upgrade "pip<21"
RUN python -m pip install wdb
RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

RUN python -m pip uninstall -y odoo
RUN rm /usr/bin/odoo

USER odoo
