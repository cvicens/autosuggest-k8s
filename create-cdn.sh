#!/bin/sh

# Environment
. ./env.sh

###### CACHE INGRESS
./autosuggest-ingress.sh ${PROJECT_ID} ${EU_COMPUTE_ZONE} ${EU_CLUSTER_NAME} ${DEV_NAMESPACE} ${CACHE_SERVICE_INGRESS}
#./autosuggest-ingress.sh ${PROJECT_ID} ${US_COMPUTE_ZONE} ${US_CLUSTER_NAME} ${DEV_NAMESPACE} ${CACHE_SERVICE_INGRESS}
#./autosuggest-ingress.sh ${PROJECT_ID} ${JP_COMPUTE_ZONE} ${EU_CLUSTER_NAME} ${DEV_NAMESPACE} ${CACHE_SERVICE_INGRESS}