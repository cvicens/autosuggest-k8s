#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "$0 US|EU"
    exit 1
fi

# Environment
. ./env.sh

if [ "$1" = "EU" ]; then
    gcloud container clusters get-credentials ${EU_CLUSTER_NAME} --zone ${EU_COMPUTE_ZONE} --project ${PROJECT_ID}
fi

if [ "$1" = "US" ]; then
    gcloud container clusters get-credentials ${US_CLUSTER_NAME} --zone ${US_COMPUTE_ZONE} --project ${PROJECT_ID}
fi

kubectl create -f ./dashboard.yaml

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

kubectl proxy --port=0
exit 0 