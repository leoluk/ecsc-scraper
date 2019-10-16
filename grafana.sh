#!/bin/bash

docker run -d \
	-p 80:3000 \
	-v grafana-storage:/var/lib/grafana \
	--name=grafana \
	-e GF_SERVER_ROOT_URL=https://ecsc.allesctf.net \
	-e GF_SECURITY_ADMIN_PASSWORD=<snip> \
	 -e GF_AUTH_ANONYMOUS_ENABLED=true \
	 -e GF_AUTH_ANONYMOUS_ORG_NAME=Public \
	 -e GF_AUTH_ANONYMOUS_ORG_ROLE=Viewer \
	--restart=always \
	grafana/grafana:5.4.5

