# DOCKER-VERSION 0.11.1
# TO tinyerp/ubuntu-odoo
# TO tinyerp/ubuntu-openerp:8.0
# FROM tinyerp/ubuntu-postgresql:9.3
FROM ubuntu:14.04

# Install tarball from master branch on GitHub
# Create PostgreSQL user "odoo"
# Untar configuration "/etc/supervisor/conf.d/odoo.conf"
# and "/etc/odoo/odoo-server.conf"

ENV DEBIAN_FRONTEND noninteractive 
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
ENV ODOO_HOME /home/odoo

ADD sources.list /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y \
    python-geoip python-gevent python-ldap python-lxml python-markupsafe python-pil python-pip \
    python-psutil python-psycopg2 python-pychart python-pydot python-reportlab python-simplejson \
    python-yaml wget wkhtmltopdf libgeoip-dev libpq-dev python-dev libldap2-dev libsasl2-dev \
    libssl-dev libxml2 libxml2-dev libxslt1-dev libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev \
    liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk python-pypdf python-egenix-mx-base-dbg



ADD odoo-8.0.zip /opt/odoo-8.0.zip
RUN apt-get install unzip && unzip /opt/odoo-8.0.zip -d /opt && mv /opt/odoo-8.0 /opt/odoo && cd /opt/odoo

#RUN wget -nv -O- https://github.com/odoo/odoo/archive/8.0.tar.gz \
#  | tar xz --xform s,^odoo-8.0,odoo, -C /opt && cd /opt/odoo

RUN pip install -e /opt/odoo

#RUN echo deb http://nightly.openerp.com/8.0/nightly/deb/ ./ \
	> /etc/apt/sources.list.d/openerp-trunk.list
#RUN apt-get update && apt-get install -y --allow-unauthenticated openerp


#RUN mkdir $ODOO_HOME
RUN adduser --system --uid=1000 --home /home/odoo --shell /bin/bash odoo
#RUN chown odoo $ODOO_HOME && chgrp odoo $ODOO_HOME
#RUN adduser --system --group --home $ODOO_HOME --shell /bin/bash odoo


# Declare volumes for data
VOLUME ["/home/odoo"]

# Expose HTTP port, and longpolling port
EXPOSE 8069 8072

#CMD ["executable","param1","param2"]
#RUN chown -R odoo /var/lib/odoo 
ENV HOME $ODOO_HOME

USER odoo

CMD openerp-server -c /home/odoo/odoo.conf
