# DOCKER-VERSION 0.12.0
TO cysnake4713/odoo8-debug
FROM cysnake4713/odoo8

RUN wget -nv -O /opt/pycharm-debug.egg https://github.com/cysnake4713/odoosoft-docker/raw/master/odoo8-debug/pycharm-debug.egg
RUN chmod 777 /opt/pycharm-debug.egg

#RUN adduser --system --uid=1000 --home /home/odoo --shell /bin/bash odoo

# Declare volumes for data
#VOLUME ["/home/odoo"]

# Expose HTTP port, and longpolling port
#EXPOSE 8069 8072

#RUN chown -R odoo /var/lib/odoo 
#ENV HOME $ODOO_HOME

#RUN pip install wechatpy

#USER odoo

#CMD openerp-server -c /home/odoo/odoo.conf

