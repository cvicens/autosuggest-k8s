#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "$0 US|EU SEARCH_TERM"
    exit 1
fi

CONCURRENCY=50
REQUESTS=5000
REGION=$1
TERM=$2

if [ "$1" = "EU" ]; then
    ab -n ${REQUESTS} -c ${CONCURRENCY} http://eu.cache.apps.viralmar.es:8080/cache/products/${TERM}
    exit 0 
fi

if [ "$1" = "US" ]; then
    ab -n ${REQUESTS} -c ${CONCURRENCY} http://us.cache.apps.viralmar.es:8080/cache/products/${TERM}
    exit 0 
fi



