FROM centos:centos7

# Install core modules
RUN yum update -y

RUN yum install -y java-1.7.0-openjdk sudo tar make openssl

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk.x86_64
ENV PATH $JAVA_HOME/bin:$PATH

# Add and extract elasticsearch
ADD pkg/elasticsearch-1.5.0.tar.gz /opt/

# RUN echo 'http.cors.enabled: true' >> /opt/elasticsearch/config/elasticsearch.yml && \
#     echo 'http.cors.allow-origin: "/.*/"' >> /opt/elasticsearch/config/elasticsearch.yml


# ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]

## kibana

# Install kibana
ADD pkg/kibana-4.0.2-linux-x64.tar.gz /opt/

RUN cd /opt &&\
    mv kibana-4.0.2-linux-x64 kibana

# Install Nginx.

# ADD nginx.repo /etc/yum.repos.d/nginx.repo

# RUN yum install -y nginx

# RUN useradd www && \
#  chown -R www:www /usr/share/nginx/html


# RUN unlink /etc/nginx/nginx.conf
# ADD nginx_kibana.conf /etc/nginx/default.d/kibana.conf

ADD start.sh /tmp/start.sh

# nginx port
# EXPOSE 80

# elasticsearch port
EXPOSE 9200
EXPOSE 9300

# kibana
EXPOSE 5601

CMD ["/tmp/start.sh"]

RUN yum clean -y all
