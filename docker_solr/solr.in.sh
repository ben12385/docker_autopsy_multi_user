
ZK_CLIENT_TIMEOUT=60000

SOLR_OPTS="$SOLR_OPTS -Dcollection.configName=AutopsyConfig"
SOLR_OPTS="$SOLR_OPTS -Dbootstrap_confdir=/opt/solr/server/solr/configsets/AutopsyConfig/conf"
DEFAULT_CONFDIR=/opt/solr/server/solr/configsets/AutopsyConfig/conf

SOLR_LOG_LEVEL=WARN

SOLR_PORT=8983
STOP_PORT=8079
# set SOLR_DATA_HOME=(TODO! Example: \\filestore2\Output\Results\SOLR_SHARDS\INGEST5 )
