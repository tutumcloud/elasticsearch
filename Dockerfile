FROM ubuntu:trusty
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

RUN apt-get update
RUN apt-get install -y wget software-properties-common 
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN add-apt-repository 'deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y elasticsearch openjdk-7-jre-headless
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx supervisor apache2-utils

ENV ELASTICSEARCH_USER **None**
ENV ELASTICSEARCH_PASS **None**

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /run.sh
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD nginx_default /etc/nginx/sites-enabled/default
RUN chmod +x /*.sh

EXPOSE 9200
CMD ["/run.sh"]
