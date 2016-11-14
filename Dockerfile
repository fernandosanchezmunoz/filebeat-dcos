FROM centos:7.2.1511
MAINTAINER Fernando Sanchez <fernando@mesosphere.io>

ENV PATH /usr/local/bin:$PATH

ADD startup.sh /startup.sh

ADD filebeat.yml /etc/filebeat/filebeat.yml

ADD dcos-journalctl-filebeat.sh /usr/bin/dcos-journalctl-filebeat.sh

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-x86_64.rpm && \
	rpm -vi filebeat-5.0.0-x86_64.rpm && \
	rm -f filebeat-5.0.0-x86_64.rpm && \
	mkdir -p /var/log/dcos && \
	chmod 0755 /usr/bin/dcos-journalctl-filebeat.sh

CMD /startup.sh