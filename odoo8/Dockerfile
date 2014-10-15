# DOCKER-VERSION 0.12.0
TO cysnake4713/odoosoft-docker:odoo8
FROM cysnake4713/odoosoft-docker:odoo8-base

#-----add code and install ------------------------
#ADD odoo-8.0.zip /opt/odoo-8.0.zip
#-------------------TODO:----------------------------------------
#RUN wget -nv -O /opt/odoo-8.0.zip https://codeload.github.com/odoo/odoo/zip/8.0
RUN wget -nv -O /opt/odoo-8.0.zip https://github.com/cysnake4713/odoo/archive/tianv.v6.zip
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

