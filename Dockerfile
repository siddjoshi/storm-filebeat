FROM centos:7

ENV    ELASTICSERVERS=localhost:9200 \
       USERNAME=elastic \
       PASSWORD=password \
       DEPLOYMENT=QA

RUN yum -y update

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

RUN yum-config-manager --add-repo https://raw.githubusercontent.com/siddjoshi/storm-filebeat/master/elastic-beats.repo

RUN yum -y install filebeat

COPY filebeat.yml /etc/filebeat/filebeat.yml

COPY docker-entrypoint.sh /

RUN chmod -R 777  /var/lib 

WORKDIR /etc/filebeat

RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

CMD ["filebeat", "-c /etc/filebeat/filebeat.yml"]