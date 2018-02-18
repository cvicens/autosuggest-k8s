#!/bin/sh

# Generic environment
export PROJECT_ID="autosuggest-194816"
export DEV_NAMESPACE="autosuggest-dev"

export NETWORK_NAME="autosuggest-network"

export MACHINE_TYPE="n1-standard-1"
export NUM_NODES="2"
export DISK_SIZE="40"

# Specific environment
export EU_CLUSTER_NAME="autosuggest-cluster-eu"
export EU_COMPUTE_REGION="europe-west1"
export EU_COMPUTE_ZONE="${EU_COMPUTE_REGION}-d"
export EU_SUBNETWORK_NAME="autosuggest-subnetwork-${EU_COMPUTE_ZONE}"

export US_CLUSTER_NAME="autosuggest-cluster-us"
export US_COMPUTE_REGION="us-central1"
export US_COMPUTE_ZONE="${US_COMPUTE_REGION}-a"
export US_SUBNETWORK_NAME="autosuggest-subnetwork-${US_COMPUTE_ZONE}"

