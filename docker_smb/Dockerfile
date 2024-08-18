FROM debian:bookworm-slim

RUN apt update && apt install -y samba

RUN mkdir /tmp/sambashare
 
COPY listOfUsers /tmp/listOfUsers

COPY createUsers.sh /tmp/createUsers.sh

RUN chmod +x /tmp/createUsers.sh; /tmp/createUsers.sh

RUN rm /tmp/listOfUsers /tmp/createUsers.sh

# Copy config
COPY smb.conf /etc/samba/smb.conf

RUN chmod 777 -R /tmp/sambashare

ENTRYPOINT /usr/sbin/smbd --foreground --no-process-group

# sudo podman build -t samba:0.1 .
# sudo podman run --name autopsy_samba --rm -d -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 445:445 samba:0.1