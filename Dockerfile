FROM ubuntu:saucy
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

RUN apt-get install -y wget software-properties-common 
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN add-apt-repository 'deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless elasticsearch

EXPOSE 9200
CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
