FROM centos:7

ENV    ELASTICSERVERS=localhost:9200 \
       USERNAME=elastic \
       PASSWORD=password \
       ZDEPLOYMENT=QA

RUN yum -y update

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

RUN yum-config-manager --add-repo https://raw.githubusercontent.com/siddjoshi/storm-filebeat/master/elastic-beats.repo

RUN yum -y install filebeat

COPY filebeat.yml /etc/filebeat/filebeat.yml

COPY docker-entrypoint.sh /

WORKDIR /etc/filebeat

RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

CMD [ "" ]