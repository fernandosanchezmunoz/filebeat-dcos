#!/bin/bash

if [ -z "$ELASTIC_HOST" ]; then
  ELASTIC_HOST="elastic.marathon.l4lb.thisdcos.directory"
fi
if [ -z "$ELASTIC_PORT" ]; then
  ELASTIC_PORT=9200
fi

sed -i -e "s/ELASTIC_HOST:ELASTIC_PORT/$ELASTIC_HOST:$ELASTIC_PORT/g" /etc/filebeat/filebeat.yml

#/usr/bin/journalctl --vacuum-size=10M &

#Ideally this should be able to get the logs from running instances of DC/OS service into /var/log/dcos.log.
#Currently not working (journalctl inside a container doesn't seem to work)
#/bin/dcos-journalctl-filebeat.sh &

#start filebeat
/usr/share/filebeat/bin/filebeat -c /etc/filebeat/filebeat.yml -path.home /usr/share/filebeat -path.config /etc/filebeat -path.data /var/lib/filebeat -path.logs /var/log/filebeat
