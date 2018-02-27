#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "$0 US|EU SEARCH_TERM"
    exit 1
fi

CONCURRENCY=1
REQUESTS=10
REGION=$1
TERM=$2

cat <<EOF > db-search.json
{
	"term" : "${TERM}"
}
EOF


if [ "$1" = "EU" ]; then
    ab -k -n ${REQUESTS} -c ${CONCURRENCY} -p db-search.json -H "Accept-Encoding: gzip,deflate" http://eu.catalog.apps.viralmar.es:8080/catalog
fi

if [ "$1" = "US" ]; then
    ab -k -n ${REQUESTS} -c ${CONCURRENCY} -p db-search.json -H "Accept-Encoding: gzip,deflate" http://us.catalog.apps.viralmar.es:8080/catalog
fi

exit 0 


