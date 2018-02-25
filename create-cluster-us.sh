#!/bin/sh

# Environment
. ./env.sh

# Custom VPC network
gcloud compute networks create ${NETWORK_NAME} \
    --subnet-mode custom

gcloud compute networks subnets create ${US_SUBNETWORK_NAME} \
   --network ${NETWORK_NAME} \
   --region ${US_COMPUTE_REGION} \
   --range ${US_SUBNETWORK_RANGE}

# Create cluster on US
gcloud container clusters create $US_CLUSTER_NAME \
  --num-nodes=$NUM_NODES \
  --machine-type=$MACHINE_TYPE \
  --disk-size=$DISK_SIZE \
  --zone=${US_COMPUTE_ZONE} \
  --network=${NETWORK_NAME} \
  --subnetwork=${US_SUBNETWORK_NAME}

  ###### INFRA
./autosuggest-infra.sh ${PROJECT_ID} ${US_COMPUTE_ZONE} ${US_CLUSTER_NAME} ${DEV_NAMESPACE}

###### SERVICES
./autosuggest-services.sh ${PROJECT_ID} ${US_COMPUTE_ZONE} ${US_CLUSTER_NAME} ${DEV_NAMESPACE}

