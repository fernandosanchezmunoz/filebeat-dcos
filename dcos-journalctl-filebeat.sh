#!/bin/bash
#This should be able to log all those services to /var/log/dcos. 
#Not working as journalctl inside a container can't really access the services outside it.
/usr/bin/journalctl --no-tail -f \
  -u dcos-3dt.service 				 \
  -u dcos-3dt.socket				 \
  -u dcos-adminrouter-reload.service \
  -u dcos-adminrouter-reload.timer   \
  -u dcos-adminrouter.service        \
  -u dcos-bouncer.service            \
  -u dcos-ca.service                 \
  -u dcos-cfn-signal.service         \
  -u dcos-cosmos.service             \
  -u dcos-download.service           \
  -u dcos-epmd.service               \
  -u dcos-exhibitor.service          \
  -u dcos-gen-resolvconf.service     \
  -u dcos-gen-resolvconf.timer       \
  -u dcos-history.service            \
  -u dcos-link-env.service           \
  -u dcos-logrotate-master.timer     \
  -u dcos-marathon.service           \
  -u dcos-mesos-dns.service          \
  -u dcos-mesos-master.service       \
  -u dcos-metronome.service          \
  -u dcos-minuteman.service          \
  -u dcos-navstar.service            \
  -u dcos-networking_api.service     \
  -u dcos-secrets.service            \
  -u dcos-setup.service              \
  -u dcos-signal.service             \
  -u dcos-signal.timer               \
  -u dcos-spartan-watchdog.service   \
  -u dcos-spartan-watchdog.timer     \
  -u dcos-spartan.service            \
  -u dcos-vault.service              \
  -u dcos-logrotate-master.service   \
  -u dcos-logrotate-agent.timer            \
  -u dcos-mesos-slave.service              \
  -u dcos-adminrouter-agent.service        \
  -u dcos-adminrouter-reload.service       \
  -u dcos-adminrouter-reload.timer         \
  -u dcos-rexray.service                   \
  -u dcos-vol-discovery-priv-agent.service \
  -u dcos-logrotate-agent.service          \
  > /var/log/dcos/dcos.log 2>&1
