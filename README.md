tutum-docker-elasticsearch
==========================

Simple docker image to run an Elasticsearch server


Usage
-----

To create the image `tutum/elasticsearch`, execute the following command on tutum-docker-influxdb folder:

    docker build -t tutum/elasticsearch .

You can also pull the image from the registry:
    
    docker pull tutum/elasticsearch


Running your elasticsearch image
--------------------------------

Start your image binding the external ports `9200` to your container:
    
    docker run -d -p 9200:9200 tutum/elasticsearch

Now you can connect to Elasticsearch by:

    curl 127.0.0.1:9200
