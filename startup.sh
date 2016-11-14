#!/bin/bash

if [ -z "$ELASTIC_HOST" ]; then
  ELASTIC_HOST="elastic.marathon.l4lb.thisdcos.directory"
fi
if [ -z "$ELASTIC_PORT" ]; then
  ELASTIC_PORT=9200
fi

sed -i -e "s/ELASTIC_HOST:ELASTIC_PORT/$ELASTIC_HOST:$ELASTIC_PORT/g" /etc/filebeat.yml

/usr/bin/journalctl --vacuum-size=10M

/bin/dcos-journalctl-filebeat.sh