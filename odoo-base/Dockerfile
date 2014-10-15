# DOCKER-VERSION 0.12.0
TO cysnake4713/odoosoft-docker:odoo8-base
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
