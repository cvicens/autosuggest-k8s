#!/bin/sh

# Environment
. ./env.sh

###### INFRA
./autosuggest-infra.sh ${PROJECT_ID} ${EU_COMPUTE_ZONE} ${EU_CLUSTER_NAME} ${DEV_NAMESPACE}
./autosuggest-infra.sh ${PROJECT_ID} ${US_COMPUTE_ZONE} ${US_CLUSTER_NAME} ${DEV_NAMESPACE}

###### SERVICES
./autosuggest-services.sh ${PROJECT_ID} ${EU_COMPUTE_ZONE} ${EU_CLUSTER_NAME} ${DEV_NAMESPACE}
./autosuggest-services.sh ${PROJECT_ID} ${US_COMPUTE_ZONE} ${US_CLUSTER_NAME} ${DEV_NAMESPACE}
