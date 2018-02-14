#!/bin/sh

# https://cloud.google.com/kubernetes-engine/docs/how-to/stateful-apps

export PROJECT_ID="autosuggest-194816"
export ZONE="europe-west1-d"

# Create disks
export MONGO_DISK_NAME="autosuggest-catalog-db-disk"
export MONGO_DISK_TYPE="pd-standard"
export MONGO_DISK_SIZE="20GB"
gcloud compute --project=${PROJECT_ID} disks create ${MONGO_DISK_NAME} --zone=${ZONE} --type=${MONGO_DISK_TYPE} --size=${MONGO_DISK_SIZE}

export CACHE_DISK_NAME="autosuggest-cache-disk"
export CACHE_DISK_TYPE="pd-standard"
export CACHE_DISK_SIZE="20GB"
gcloud compute --project=${PROJECT_ID} disks create ${CACHE_DISK_NAME} --zone=${ZONE} --type=${CACHE_DISK_TYPE} --size=${CACHE_DISK_SIZE}

# Add resources to kube
kubectl create -n autosuggest-dev -f ./autosuggest-infra.yaml 
kubectl create -n autosuggest-dev -f ./autosuggest-catalog-db.yaml
kubectl create -n autosuggest-dev -f ./autosuggest-cache-redis.yaml