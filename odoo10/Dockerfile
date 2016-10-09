# DOCKER-VERSION 0.12.0
FROM cysnake4713/odoo8-base

RUN apt-get update && apt-get install -y --force-yes \
libpq-dev python-dev libxml2 libxml2-dev libxslt-dev build-essential zlib1g-dev libsasl2-dev libldap2-dev libssl-dev

#RUN pip install pysftp requests==2.6.0 validate_email pyDNS pillow==2.7.0 reportlab==3.1.44

#-----add code and install ------------------------
# ADD odoo-9.0.zip /opt/odoo-9.0.zip
#-------------------TODO:----------------------------------------
RUN wget -nv -O /opt/temp.zip https://github.com/cysnake4713/odoo/archive/10.0.docker.zip
#-----------------------------------------------------------
RUN unzip -q /opt/temp.zip -d /opt && mv /opt/odoo-10.0.docker /opt/odoo && rm /opt/temp.zip
#-----------------------------------------------------------
RUN pip install  -r /opt/odoo/requirements.txt
#-----------------------------------------------------------

RUN adduser --system --uid=1000 --home /home/odoo --shell /bin/bash odoo

# Declare volumes for data
VOLUME ["/home/odoo"]

# Expose HTTP port, and longpolling port
EXPOSE 8069 8072

#RUN chown -R odoo /var/lib/odoo 
ENV HOME $ODOO_HOME

USER odoo

CMD /opt/odoo/odoo-bin -c /home/odoo/odoo.conf

