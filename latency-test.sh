#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "$0 US|EU SEARCH_TERM"
    exit 1
fi

CONCURRENCY=10
REQUESTS=1000
REGION=$1
TERM=$2

if [ "$1" = "EU" ]; then
    ab -k -n ${REQUESTS} -c ${CONCURRENCY} http://eu.cache.apps.viralmar.es:8080/cache/products/${TERM}
fi

if [ "$1" = "US" ]; then
    ab -k -n ${REQUESTS} -c ${CONCURRENCY} http://us.cache.apps.viralmar.es:8080/cache/products/${TERM}
fi

ab -k -n ${REQUESTS} -c ${CONCURRENCY} http://cdn.cache.apps.viralmar.es/cache/products/${TERM}

# Hints
echo "Create VM in the US:"
echo "gcloud compute instances create us-latency-test --zone us-central1-a"
echo "Execute test"
echo "ab -k -n ${REQUESTS} -c ${CONCURRENCY} http://us.cache.apps.viralmar.es:8080/cache/products/${TERM}"
echo "ab -k -n ${REQUESTS} -c ${CONCURRENCY} http://cdn.cache.apps.viralmar.es:8080/cache/products/${TERM}"
echo "Delete VM"
echo "gcloud compute instances delete us-latency-test --zone us-central1-a"

exit 0 


