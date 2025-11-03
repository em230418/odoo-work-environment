FROM odoo:10.0
MAINTAINER Eugene Molotov <molotov@it-projects.info>

USER root

RUN rm -f /etc/apt/sources.list && \
    rm -f /etc/apt/sources.list.d/pgdg.list && \
    echo "deb [trusted=yes] http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list.d/jessie.list && \
    echo "deb [trusted=yes] http://archive.debian.org/debian jessie main" >> /etc/apt/sources.list.d/jessie.list && \
    echo "deb [trusted=yes] http://archive.debian.org/debian jessie-backports main" >> /etc/apt/sources.list.d/jessie.list && \
    apt-get update && apt-get -y -t jessie-backports install \
    apt-transport-https \
    ca-certificates \
    openssl \
    python-pip \
    python-simplejson && \
    echo 'deb https://apt-archive.postgresql.org/pub/repos/apt jessie-pgdg-archive main' > /etc/apt/sources.list.d/pgdg.list

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && python get-pip.py

RUN python -m pip install wdb uncompyle6"<=3.9.0"
RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

RUN python -m pip uninstall -y odoo
RUN rm /usr/bin/odoo

USER odoo
