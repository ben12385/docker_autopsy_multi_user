FROM solr:8.6.3-slim

ARG SOLR_VERSION=8.6.3

COPY AutopsyConf /opt/solr/server/solr/configsets/AutopsyConfig/conf
COPY solr.in.sh /etc/default/solr.in.sh

ENTRYPOINT docker-entrypoint.sh solr start -c -f -force

# RUN ls /var/solr; exit 1;

EXPOSE 8983
EXPOSE 8079