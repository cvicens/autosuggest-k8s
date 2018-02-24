#!/bin/sh

# https://cloud.google.com/kubernetes-engine/docs/how-to/stateful-apps

if [ "$#" -ne 5 ]; then
    echo "$0 PROJECT_ID COMPUTE_ZONE CLUSTER_NAME NAMESPACE INGRESS_NAME"
    exit 1
fi

export PROJECT_ID=$1
export COMPUTE_ZONE=$2
export CLUSTER_NAME=$3
export NAMESPACE=$4
export INGRESS_NAME=$5

## Get credentials
gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${COMPUTE_ZONE} --project ${PROJECT_ID}

# Create ingress
kubectl -n ${DEV_NAMESPACE} create -f ./autosuggest-ingress.yaml

sleep 120

# Find ingress entries and eneble CDN
export BACKEND=$(kubectl -n ${DEV_NAMESPACE} get ing ${INGRESS_NAME} -o json | jq -j '.metadata.annotations."ingress.kubernetes.io/backends"' | jq -j 'keys[0]')

gcloud compute backend-services update $BACKEND --global --enable-cdn