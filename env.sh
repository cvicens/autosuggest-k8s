#!/bin/sh

# Generic environment
export PROJECT_ID="autosuggest-194816"
export DEV_NAMESPACE="autosuggest-dev"

export NETWORK_NAME="autosuggest-network"

export MACHINE_TYPE="n1-standard-1"
export NUM_NODES="3"
export DISK_SIZE="40"

export CACHE_SERVICE_INGRESS="autosuggest-cache-ingress"

# Specific environment
export EU_CLUSTER_NAME="autosuggest-cluster-eu"
export EU_COMPUTE_REGION="europe-west1"
export EU_COMPUTE_ZONE="${EU_COMPUTE_REGION}-d"
export EU_SUBNETWORK_NAME="autosuggest-subnetwork-${EU_COMPUTE_ZONE}"

export US_CLUSTER_NAME="autosuggest-cluster-us"
export US_COMPUTE_REGION="us-central1"
export US_COMPUTE_ZONE="${US_COMPUTE_REGION}-a"
export US_SUBNETWORK_NAME="autosuggest-subnetwork-${US_COMPUTE_ZONE}"

export JP_CLUSTER_NAME="autosuggest-cluster-jp"
export JP_COMPUTE_REGION="asia-east1"
export JP_COMPUTE_ZONE="${US_COMPUTE_REGION}-a"
export JP_SUBNETWORK_NAME="autosuggest-subnetwork-${JP_COMPUTE_ZONE}"
