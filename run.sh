#!/bin/bash

set -e

if [ "${USER}" == "**None**" ] && [ "${PASS}" == "**None**" ]; then
    echo "=> Starting Elasticsearch with no base auth ..."
    echo "========================================================================"
    echo "You can now connect to this Elasticsearch Server using:"
    echo ""
    echo "    curl localhost:9200"
    echo ""
    echo "========================================================================"
    exec /usr/share/elasticsearch/bin/elasticsearch -Des.http.port=9200
else
    echo "=> Starting Elasticsearch with basic auth ..."
    echo ${PASS} | htpasswd -i -c /htpasswd  ${USER}
    echo "========================================================================"
    echo "You can now connect to this Elasticsearch Server using:"
    echo ""
    echo "    curl ${USER}:${PASS}@localhost:9200"
    echo ""
    echo "========================================================================"
    exec supervisord -n
fi
