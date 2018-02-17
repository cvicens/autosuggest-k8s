#!/bin/sh

# Generic environment
export PROJECT_ID="autosuggest-194816"

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

# Custom VPV network
gcloud compute networks create ${NETWORK_NAME} \
    --subnet-mode custom

gcloud compute networks subnets create ${EU_SUBNETWORK_NAME} \
   --network ${NETWORK_NAME} \
   --region ${EU_COMPUTE_REGION} \
   --range 10.240.1.0/24

gcloud compute networks subnets create ${US_SUBNETWORK_NAME} \
   --network ${NETWORK_NAME} \
   --region ${US_COMPUTE_REGION} \
   --range 10.240.2.0/24

# Create cluster on EU
gcloud container clusters create $EU_CLUSTER_NAME \
  --num-nodes=$NUM_NODES \
  --machine-type=$MACHINE_TYPE \
  --disk-size=$DISK_SIZE \
  --zone=${EU_COMPUTE_ZONE} \
  --network=${NETWORK_NAME} \
  --subnetwork=${SUBNETWORK_NAME}

# Create cluster onUS
gcloud container clusters create $US_CLUSTER_NAME \
  --num-nodes=$NUM_NODES \
  --machine-type=$MACHINE_TYPE \
  --disk-size=$DISK_SIZE \
  --zone=${US_COMPUTE_ZONE} \
  --network=${NETWORK_NAME} \
  --subnetwork=${SUBNETWORK_NAME}

