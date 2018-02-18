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

## Get nodes
kubectl get nodes

## Create a namespace
kubectl create namespace ${DEV_NAMESPACE}

# Create disks
export MONGO_DISK_NAME="autosuggest-catalog-db-disk-dev"
export MONGO_DISK_TYPE="pd-standard"
export MONGO_DISK_SIZE="20GB"
gcloud compute --project=${PROJECT_ID} disks create ${MONGO_DISK_NAME} --zone=${COMPUTE_ZONE} --type=${MONGO_DISK_TYPE} --size=${MONGO_DISK_SIZE}

export CACHE_DISK_NAME="autosuggest-cache-disk-dev"
export CACHE_DISK_TYPE="pd-standard"
export CACHE_DISK_SIZE="20GB"
gcloud compute --project=${PROJECT_ID} disks create ${CACHE_DISK_NAME} --zone=${COMPUTE_ZONE} --type=${CACHE_DISK_TYPE} --size=${CACHE_DISK_SIZE}

# Add resources to kube
#kubectl create -n ${NAMESPACE} -f ./autosuggest-infra.yaml => disks are created directly... so no need for PVs, PVCs... although we should do it using them...
kubectl create -n ${NAMESPACE} -f ./autosuggest-catalog-db.yaml
kubectl create -n ${NAMESPACE} -f ./autosuggest-cache-redis.yaml