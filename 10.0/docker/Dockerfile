FROM debian:jessie
MAINTAINER Eugene Molotov <molotov@it-projects.info>

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            dirmngr \
            node-less \
            python-gevent \
            python-ldap \
            python-pip \
            python-qrcode \
            python-renderpm \
            python-support \
            python-vobject \
            python-watchdog \
        && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.jessie_amd64.deb \
        && echo '4d104ff338dc2d2083457b3b1e9baab8ddf14202 wkhtmltox.deb' | sha1sum -c - \
        && dpkg --force-depends -i wkhtmltox.deb \
        && apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
        && pip install psycogreen==1.0

RUN apt-get update

RUN python -m pip install --upgrade "pip<21"

RUN apt-get install -y build-essential libffi-dev python-dev cargo

RUN apt-get install -y libpq-dev

RUN apt-get install -y libldap2-dev libsasl2-dev libssl-dev

RUN curl https://raw.githubusercontent.com/odoo/odoo/11.0/requirements.txt > /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt

RUN python3 -m pip install wdb

# psql is required to make/restore backups
RUN apt-get install -y postgresql-client

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/
RUN chown odoo /etc/odoo/odoo.conf

RUN mkdir /var/lib/odoo && \
    groupadd odoo && \
    useradd -g odoo odoo -d /var/lib/odoo && \
    chown odoo:odoo /var/lib/odoo

# Set permissions and Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
RUN chown odoo /etc/odoo/odoo.conf \
    && mkdir -p /mnt/extra-addons \
    && chown -R odoo /mnt/extra-addons
VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# Expose Odoo services
EXPOSE 8069 8071

# Set the default config file
ENV ODOO_RC /etc/odoo/odoo.conf

COPY wait-for-psql.py /usr/local/bin/wait-for-psql.py

RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

# Set default user when running the container
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
