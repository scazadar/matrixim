#!/bin/bash
rm -f /homeserver.db
python -m synapse.app.homeserver \
	--server-name $SERVERNAME \
	--config-path /etc/matrixim/homeserver.yaml \
	--generate-config \
	--report-stats=no
mkdir -p /etc/matrixim/db
synctl start /etc/matrixim/homeserver.yaml
tail -f /homeserver.log
