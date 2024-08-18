ARG ACTIVEMQ_VERSION
FROM apache/activemq-classic:6.1.0

# Copy configs
COPY activemq.xml conf/activemq.xml
COPY groups.properties conf/groups.properties
COPY users.properties conf/users.properties

# Set username and passowrd
RUN sed -i "s/{{ AUTOPSY_USERNAME }}/Autopsy/g" conf/activemq.xml
RUN sed -i "s/{{ AUTOPSY_PASSWORD }}/myPassword/g" conf/activemq.xml