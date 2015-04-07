#!/bin/sh

# start nginx
# /usr/sbin/nginx

if [ $1 = 'es' ]; then
    echo "starting elasticsearch server"
    /opt/elasticsearch-1.5.0/bin/elasticsearch
elif [ $1 = 'kibana' ]; then

    if [ -n "$ELASTIC_URl" ]; then
        # ENV['ELASTIC_URl'] is set(without 'http:// prefix')
        sed -i -e "s/localhost:9200/${ELASTIC_URl}/g" /opt/kibana/config/kibana.yml
    fi

    echo "starting kibana"
    /opt/kibana/bin/kibana
else
    echo "starting elasticsearch server"
    /opt/elasticsearch-1.5.0/bin/elasticsearch &

    # wait elasticsearch to startup
    sleep 3

    echo "starting kibana"
    /opt/kibana/bin/kibana
fi

