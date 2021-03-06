#!/bin/sh

# Environment
. ./env.sh

# Custom VPC network
gcloud compute networks create ${NETWORK_NAME} \
    --subnet-mode custom

gcloud compute networks subnets create ${EU_SUBNETWORK_NAME} \
   --network ${NETWORK_NAME} \
   --region ${EU_COMPUTE_REGION} \
   --range ${EU_SUBNETWORK_RANGE}

gcloud compute networks subnets create ${US_SUBNETWORK_NAME} \
   --network ${NETWORK_NAME} \
   --region ${US_COMPUTE_REGION} \
   --range ${US_SUBNETWORK_RANGE}

# Create cluster on EU
gcloud container clusters create $EU_CLUSTER_NAME \
  --num-nodes=$NUM_NODES \
  --machine-type=$MACHINE_TYPE \
  --disk-size=$DISK_SIZE \
  --zone=${EU_COMPUTE_ZONE} \
  --network=${NETWORK_NAME} \
  --subnetwork=${EU_SUBNETWORK_NAME}

# Create cluster onUS
gcloud container clusters create $US_CLUSTER_NAME \
  --num-nodes=$NUM_NODES \
  --machine-type=$MACHINE_TYPE \
  --disk-size=$DISK_SIZE \
  --zone=${US_COMPUTE_ZONE} \
  --network=${NETWORK_NAME} \
  --subnetwork=${US_SUBNETWORK_NAME}

