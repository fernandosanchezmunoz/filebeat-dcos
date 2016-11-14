# filebeat-dcos

Work in progress aiming to produce a container image that is self-sufficient to capture all logs related to DC/OS on an agent, and use filebeat to send them towards an ElasticSearch endpoint. The target is to be able to deploy this in DC/OS and "automagically" get the logs from all agents, without needing to do any additional configuration.

Currently operational on the filebeat piece (getting logs from /var/lib/mesos, /var/log/mesos and /var/log/dcos from the host and sending them to a centralized ES instance whose IP@ and port are passed as environment variables. 

Missing: Given that DC/OS services log to journald, this still requires to run a systemd service in the host with journalctl getting the logs from all DC/OS services and sending them to a file in /var/log/dcos as described [here](https://github.com/dcos/dcos-docs/blob/master/1.8/administration/logging/elk.md#step-2-agent-nodes).

Looking for a way to parse the DC/OS logs from inside the container without having to run the journalctl systemd service in the agents...
