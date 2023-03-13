FROM odoo:14.0
MAINTAINER Eugene Molotov <molotov@it-projects.info>

USER root

RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wdb
RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

RUN python3 -m pip uninstall -y odoo
RUN rm /usr/bin/odoo

USER odoo
