#!/bin/sh

export NAMESPACE='autosuggest-dev'
export DEPLOYMENT='autosuggest-app-deployment'
export CONTAINER_NAME='autosuggest-app'
export IMAGE='eu.gcr.io/autosuggest-194816/autosuggest-app'
export TAG='v0.1.4'
export PATCH="{\"spec\":{\"template\":{\"spec\":{\"containers\":[{\"name\":\"${CONTAINER_NAME}\",\"image\":\"${IMAGE}:${TAG}\"}]}}}}"


kubectl patch deployment ${DEPLOYMENT} -n ${NAMESPACE} -p ${PATCH}


### "container.clusters.get" permission for "projects/autosuggest-194816/zones/europe-west1-d/clusters/autosuggest-cluster-eu"