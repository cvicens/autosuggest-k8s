#!/bin/sh

# Environment
. ./env.sh

###### EUROPE
./autosuggest-infra.sh ${PROJECT_ID} ${EU_COMPUTE_ZONE} ${EU_CLUSTER_NAME}

## Get credentials
gcloud container clusters get-credentials ${EU_CLUSTER_NAME} --zone ${EU_COMPUTE_ZONE} --project ${PROJECT_ID}

## Get nodes
kubectl get nodes

## Create a namespace
kubectl create namespace autosuggest-dev

## Create frontend app
kubectl create -n autosuggest-dev -f ./autosuggest-app.yaml
kubectl expose deployment autosuggest-app-deployment --type=LoadBalancer --name=autosuggest-app-service

###### USA

## Get credentials
gcloud container clusters get-credentials ${US_CLUSTER_NAME} --zone ${US_COMPUTE_ZONE} --project ${PROJECT_ID}

## Get nodes
kubectl get nodes

## Create a namespace
kubectl create namespace autosuggest-dev

## Create frontend app
kubectl create -n autosuggest-dev -f ./autosuggest-app.yaml
kubectl expose deployment autosuggest-app-deployment --type=LoadBalancer --name=autosuggest-app-service

