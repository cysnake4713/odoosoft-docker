# DOCKER-VERSION 0.12.0
TO cysnake4713/odoo8
FROM cysnake4713/odoo8-base

RUN apt-get -y install ttf-wqy-microhei ttf-wqy-zenhei

RUN pip install wechatpy

#-----add code and install ------------------------
# ADD odoo-8.0.zip /opt/odoo-8.0.zip
#-------------------TODO:----------------------------------------
RUN wget -nv -O /opt/temp.zip https://github.com/cysnake4713/odoo/archive/8.0.custom.zip
#-----------------------------------------------------------
RUN unzip -q /opt/temp.zip -d /opt && mv /opt/odoo-8.0.custom /opt/odoo && rm /opt/temp.zip
#-----------------------------------------------------------
RUN pip install -e /opt/odoo
#-----------------------------------------------------------

RUN adduser --system --uid=1000 --home /home/odoo --shell /bin/bash odoo

# Declare volumes for data
VOLUME ["/home/odoo"]

# Expose HTTP port, and longpolling port
EXPOSE 8069 8072

#RUN chown -R odoo /var/lib/odoo 
ENV HOME $ODOO_HOME

USER odoo

CMD openerp-server -c /home/odoo/odoo.conf

