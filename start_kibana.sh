#!/bin/sh


# ENV['ELASTIC_HOST'] and ENV['ELASTIC_PORT'] is set


sed -i -e "s/http:\/\/localhost:9200/http:\/\/es-es-liubin.alauda.me:10427/g" /opt/kibana/config/kibana.yml && /opt/kibana/bin/kibana


/opt/kibana/bin/kibana
