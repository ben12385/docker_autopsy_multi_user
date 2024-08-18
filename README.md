# Components of Multi-User Autopsy
1. Samba Share
2. PostgreSQL
3. Apache Solr
4. Apache ZooKeeper
5. ActiveMQ


# Quick Start
docker compose up

Connect to Samba On Folder autopsy

Configure Autopsy Client to use MultiUser

# How to Use
Samba Share must store both case data and evidence, this is for all Autopsy clients to access both files
To map folder using UNC and not map drive because the map drive letters must be the same across all Autopsy clients

## Deploying Samba Share
sudo podman build -t samba:0.1 -f docker_smb/Dockerfile
sudo podman run --name autopsy_samba --rm -d -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 445:445 samba:0.1

## Deploying PostgreSQL
podman run --name autopsy_postgres --rm -d -p 5432:5432 \
-e POSTGRES_USER=admin \
-e POSTGRES_PASSWORD=abcdefg \
-e POSTGRES_DB=autopsy \
-e POSTGRES_PORT=54322 \
-v ./docker_postgres/postgresScript.sql:/docker-entrypoint-initdb.d/postgresScript.sql \
postgres:12.19-alpine -c fsync=off -c synchronous_commit=off -c full_page_writes=off -c max_connections=100

## Deploying Solr
Need to run as root to access Zookeeper if on the same host
sudo podman build -t solr:0.1 -f docker_solr/Dockerfile; \
sudo podman run --name autopsy-solr-1 --rm \
--add-host=host.docker.internal:host-gateway \
-p 8983:8983 -p 8079:8079 \
--memory=1G \
solr:0.1



## Deploying Zookeeper
sudo podman run --name autopsy-zookeeper --rm \
-e ZOO_ADMINSERVER_ENABLED=true \
-e ZOO_STANDALONE_ENABLED=true \
-e ZOO_4LW_COMMANDS_WHITELIST=* \
-p 9983:2181 -p 8080:8080 \
zookeeper:3.5.7

## Deploying ActiveMQ
podman build -t activemq:0.1 -f docker_activemq/Dockerfile; \
podman run --name autopsy-activemq --rm \
-p 61616:61616 -p 8161:8161 \
activemq:0.1



# FAQ
## Solr Error 
### Problem
Error when creating core
java.util.concurrent.ExecutionException: org.apache.solr.client.solrj.SolrServerException: IOException occurred when talking to server at: http://autospy-solr-1:8983/solr

### Solution
Means that SOLR_HOST needs to be amended to a value that is accessible by itself, sometimes hostname may have issues