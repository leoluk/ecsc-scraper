#!/bin/bash

docker run -d \
	-p 80:3000 \
	-v grafana-storage:/var/lib/grafana \
	--name=grafana \
	-e "GF_SERVER_ROOT_URL=https://ecsc.allesctf.net" \
	-e "GF_SECURITY_ADMIN_PASSWORD=<snip>" \
	--restart=always \
	grafana/grafana

