#!/bin/sh

export PROJECT_ID="autosuggest-194816"
export ZONE="europe-west1-d"

# Add resources to kube
kubectl create -n autosuggest-dev -f ./autosuggest-app-service.yaml
kubectl create -n autosuggest-dev -f ./autosuggest-cache-service.yaml
kubectl create -n autosuggest-dev -f ./autosuggest-catalog-service.yaml