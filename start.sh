#!/bin/sh

# start nginx
# /usr/sbin/nginx

# start elasticsearch
/opt/elasticsearch-1.5.0/bin/elasticsearch &

# wait elasticsearch to startup
sleep 3

/opt/kibana/bin/kibana
