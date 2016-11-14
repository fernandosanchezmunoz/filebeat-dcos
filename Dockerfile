FROM centos:7.2.1511
MAINTAINER Fernando Sanchez <fernando@mesosphere.io>

ADD startup.sh /startup.sh

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-x86_64.rpm && \
	rpm -vi filebeat-5.0.0-x86_64.rpm 

#volume 1: /var/lib/mesos to /var/lib/mesos
#volume 2: /var/log/ to /var/log/

CMD /startup.sh