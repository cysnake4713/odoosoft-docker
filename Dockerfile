# DOCKER-VERSION 0.12.0
# TO cysnake4713/odoo8
FROM ubuntu:14.04

# -----------------Set ENV----------------------------- 
RUN locale-gen en_US.UTF-8 && update-locale && echo 'LANG="en_US.UTF-8"' > /etc/default/locale && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
ENV ODOO_HOME /home/odoo
#-----------------------------------------------------------

#------------Only used for locate build-----------
# ADD sources.list /etc/apt/sources.list
RUN apt-get update
#-----------------------------------------------------------

# -------------------Install dependencies------------------
#RUN apt-get install -y \
#   python-geoip python-gevent python-ldap python-lxml python-markupsafe python-pil python-pip \
#   python-psutil python-psycopg2 python-pychart python-pydot python-reportlab python-simplejson \
#   python-yaml wget wkhtmltopdf libgeoip-dev libpq-dev python-dev libldap2-dev libsasl2-dev \
#   libssl-dev libxml2 libxml2-dev libxslt1-dev libtiff4-dev libjpeg8-dev zlib1g-dev libfreetype6-dev \
#   liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk python-pypdf python-egenix-mx-base-dbg
#-----------------------------------------------------------
RUN apt-get install -y \ 
python-dateutil python-decorator python-docutils python-feedparser \
python-gdata python-gevent python-imaging python-jinja2 python-ldap python-libxslt1 python-lxml \
python-mako python-mock python-openid python-passlib python-psutil python-psycopg2 python-pybabel \
python-pychart python-pydot python-pyparsing python-pypdf python-reportlab python-requests \
python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-werkzeug \
python-xlwt python-yaml wkhtmltopdf \
python-pip unzip wget
#-----------------------------------------------------------

#-----add code and install ------------------------
#ADD odoo-8.0.zip /opt/odoo-8.0.zip
#-------------------TODO:----------------------------------------
RUN wget -nv -O /opt/odoo-8.0.zip https://codeload.github.com/odoo/odoo/zip/8.0
#-----------------------------------------------------------
RUN unzip /opt/odoo-8.0.zip -d /opt && mv /opt/odoo-8.0 /opt/odoo && rm /opt/odoo-8.0.zip
#-----------------------------------------------------------
 RUN pip install -e /opt/odoo
#-----------------------------------------------------------

RUN adduser --system --uid=1000 --home /home/odoo --shell /bin/bash odoo
#RUN chown odoo $ODOO_HOME && chgrp odoo $ODOO_HOME
#RUN adduser --system --group --home $ODOO_HOME --shell /bin/bash odoo

# Declare volumes for data
VOLUME ["/home/odoo"]

# Expose HTTP port, and longpolling port
EXPOSE 8069 8072

#RUN chown -R odoo /var/lib/odoo 
ENV HOME $ODOO_HOME

USER odoo

CMD openerp-server -c /home/odoo/odoo.conf

