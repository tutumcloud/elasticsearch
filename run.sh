#!/bin/bash

set -e

if [ "${ELASTICSEARCH_USER}" == "**None**" ] && [ "${ELASTICSEARCH_PASS}" == "**None**" ]; then
    echo "=> Starting Elasticsearch with no base auth ..."
    echo "========================================================================"
    echo "You can now connect to this Elasticsearch Server using:"
    echo ""
    echo "    curl localhost:9200"
    echo ""
    echo "========================================================================"
    exec /usr/share/elasticsearch/bin/elasticsearch -Des.http.port=9200
else
    USER=${ELASTICSEARCH_USER:-admin}
    echo "=> Starting Elasticsearch with basic auth ..."
    echo ${ELASTICSEARCH_PASS} | htpasswd -i -c /htpasswd ${USER}
    echo "========================================================================"
    echo "You can now connect to this Elasticsearch Server using:"
    echo ""
    echo "    curl ${USER}:${ELASTICSEARCH_PASS}@localhost:9200"
    echo ""
    echo "========================================================================"
    exec supervisord -n
fi
