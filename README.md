# es-dashboard

es dashboard manage logs collected from fluentd-agent(or others).

Bundled with:
- CentOS 7
- JDK 1.7.0
- ElasticSearch: 1.5.0
- Kibana: 4.0.2

# How to run


```
# build image
sudo docker build -t liubin/es-dashboard .

# start a container
sudo docker run -p 9200:9200 -p 9300:9300 -p 5601:5601 liubin/es-dashboard
```

**It's recommend that use it with [fluentd-agent](https://github.com/liubin/fluentd-agent), which will collect log from nginx using fluentd.**

```
git clone https://github.com/liubin/fluentd-agent.git
cd fluentd-agent
sudo docker build -t liubin/fluentd-agent .

# get es's IP
sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' dashboard
# 172.17.0.92
sudo docker run -e ELASTIC_HOST=172.17.0.92 -e ELASTIC_PORT=9200 -v /var/log:/var/log --name agent liubin/fluentd-agent
```

And then open `http://localhost:5601/` in your browser.


Or you can run elastaicsearch and kibana in two containers:

```
sudo docker run -p 9200:9200 -p 9300:9300 liubin/es-dashboard --name es /tmp/start.sh es

# or (kibana only)

sudo docker run -p 5601:5601 -e ELASTIC_URl=192.168.33.121:9200 --name kibana liubin/es-dashboard /tmp/start.sh kibana

```

# TODOs

- Need nginx?
- [Run in production](http://www.elastic.co/guide/en/kibana/current/production.html)