FROM odoo:19.0
MAINTAINER Eugene Molotov <molotov@it-projects.info>

USER root

ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN apt-get update && apt-get install -y \
    python3-click \
    python3-importmagic \
    python3-jedi

RUN python3 -m pip install wdb
RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

RUN python3 -m pip uninstall -y odoo
RUN rm /usr/bin/odoo

USER odoo
