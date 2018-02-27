#!/bin/bash
rm -rf /etc/matrixim/*
python -m synapse.app.homeserver \
	--server-name $SERVERNAME \
	--config-path /etc/matrixim/homeserver.yaml \
	--generate-config \
	--report-stats=no
synctl start /etc/matrixim/homeserver.yaml
tail -f /homeserver.log
