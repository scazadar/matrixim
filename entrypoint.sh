#!/bin/bash
python -m synapse.app.homeserver \
	--server-name mbgmuc.de \
	--config-path /opt/homeserver.yaml \
	--generate-config \
	--report-stats=no
synctl start /opt/homeserver.yaml
tail -f /homeserver.log
