FROM docker.elastic.co/beats/filebeat:7.4.2

ENV    ELASTICSERVERS=localhost:9200 \
       USERNAME=elastic \
       PASSWORD=password \
       DEPLOYMENT=QA


COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml

#RUN yum -y update

#RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

#RUN yum-config-manager --add-repo https://raw.githubusercontent.com/siddjoshi/storm-filebeat/master/elastic-beats.repo

#RUN yum -y install filebeat

#COPY filebeat.yml /etc/filebeat/filebeat.yml

COPY docker-entrypoint.sh /

#RUN chmod -R 777  /var/lib

#RUN mkdir /var/lib/filebeat

#RUN chmod -R 777 /var/lib/filebeat

#USER root

#WORKDIR /etc/filebeat

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

##USER filebeat
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

#CMD ["filebeat", "-c /etc/filebeat/filebeat.yml"]