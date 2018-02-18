#!/bin/sh

#!/bin/sh

# https://cloud.google.com/kubernetes-engine/docs/how-to/stateful-apps

if [ "$#" -ne 4 ]; then
    echo "$0 PROJECT_ID COMPUTE_ZONE CLUSTER_NAME NAMESPACE"
    exit 1
fi

export PROJECT_ID=$1
export COMPUTE_ZONE=$2
export CLUSTER_NAME=$3
export NAMESPACE=$4

## Get credentials
gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${COMPUTE_ZONE} --project ${PROJECT_ID}

# Add resources to kube
kubectl create -n ${NAMESPACE} -f ./autosuggest-app-service.yaml
kubectl create -n ${NAMESPACE} -f ./autosuggest-cache-service.yaml
kubectl create -n ${NAMESPACE} -f ./autosuggest-catalog-service.yaml