FROM odoo:12.0
MAINTAINER Eugene Molotov <molotov@it-projects.info>

USER root

RUN python3 -m pip install pip --upgrade

RUN rm -f /etc/apt/sources.list && \
    rm -f /etc/apt/sources.list.d/backports.list && \
    echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian stretch main" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/backports.list && \
    apt-get update && apt-get install -y \
    python3-click \
    python3-jedi \
    python3-magic \
    python3-parso \
    python3-setuptools

RUN python3 -m pip install wdb
RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

RUN python3 -m pip uninstall -y odoo
RUN rm /usr/bin/odoo

USER odoo
