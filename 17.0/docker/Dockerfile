FROM registry.altlinux.org/alt/base:p11
MAINTAINER Eugene Molotov <eugene.molotov@yandex.ru>

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG en_US.UTF-8

# Retrieve the target architecture to install the correct wkhtmltopdf package
ARG TARGETARCH

# TODO: wkhtmltopdf

# Install some deps, lessc and less-plugin-clean-css
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl \
        dirmngr \
        fonts-otf-google-noto-cjk \
        gnupg \
        lessjs \
        libssl-devel \
        npm \
        odfpy \
        pdfminersix \
        python3-module-GeoIP2 \
        python3-module-Pillow \
        python3-module-PyPDF2 \
        python3-module-Reportlab \
        python3-module-babel \
        python3-module-chardet \
        python3-module-cryptography \
        python3-module-dateutil \
        python3-module-decorator \
        python3-module-docutils \
        python3-module-freezegun \
        python3-module-gevent \
        python3-module-greenlet \
        python3-module-idna \
        python3-module-jinja2 \
        python3-module-libsass \
        python3-module-lxml \
        python3-module-lxml-html-clean \
        python3-module-magic \
        python3-module-markupsafe \
        python3-module-num2words \
        python3-module-ofxparse \
        python3-module-openssl \
        python3-module-passlib \
        python3-module-phonenumbers \
        python3-module-pip \
        python3-module-polib \
        python3-module-psutil \
        python3-module-psycopg2 \
        python3-module-pydot \
        python3-module-pyldap \
        python3-module-pytz \
        python3-module-pyusb \
        python3-module-qrcode \
        python3-module-requests \
        python3-module-rjsmin \
        python3-module-setuptools \
        python3-module-slugify \
        python3-module-stdnum \
        python3-module-urllib3 \
        python3-module-vobject \
        python3-module-watchdog \
        python3-module-werkzeug \
        python3-module-xlrd \
        python3-module-xlsxwriter \
        python3-module-xlwt \
        python3-module-zeep \
        xz \
    && find /var/lib/apt/lists/ -type f -delete

# install postgresql-client
RUN apt-get update \
    && apt-get install -y postgresql13 \
    && find /var/lib/apt/lists/ -type f -delete

# Install rtlcss
RUN npm install -g rtlcss

RUN ln -s /mnt/common/odoo/odoo/odoo-bin /usr/local/bin/odoo

# Make odoo user and group
ARG ODOO_UID=501
ARG ODOO_GID=501

RUN groupadd -g ${ODOO_GID} odoo && useradd -m -d /var/lib/odoo --uid ${ODOO_UID} --gid ${ODOO_GID} odoo

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/

# Set permissions and Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
RUN chown odoo /etc/odoo/odoo.conf \
    && mkdir -p /mnt/extra-addons \
    && chown -R odoo /mnt/extra-addons
VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

# Expose Odoo services
EXPOSE 8069 8071 8072

# Set the default config file
ENV ODOO_RC /etc/odoo/odoo.conf

COPY wait-for-psql.py /usr/local/bin/wait-for-psql.py

# Set default user when running the container
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
