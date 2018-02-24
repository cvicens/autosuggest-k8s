#!/bin/sh

# Environment
. ./env.sh

# Custom VPC network
gcloud compute networks create ${NETWORK_NAME} \
    --subnet-mode custom

gcloud compute networks subnets create ${JP_SUBNETWORK_NAME} \
   --network ${NETWORK_NAME} \
   --region ${JP_COMPUTE_REGION} \
   --range 10.240.3.0/24

# Create cluster on JP
gcloud container clusters create $JP_CLUSTER_NAME \
  --num-nodes=$NUM_NODES \
  --machine-type=$MACHINE_TYPE \
  --disk-size=$DISK_SIZE \
  --zone=${JP_COMPUTE_ZONE} \
  --network=${NETWORK_NAME} \
  --subnetwork=${JP_SUBNETWORK_NAME}

  ###### INFRA
./autosuggest-infra.sh ${PROJECT_ID} ${JP_COMPUTE_ZONE} ${JP_CLUSTER_NAME} ${DEV_NAMESPACE}

###### SERVICES
./autosuggest-services.sh ${PROJECT_ID} ${JP_COMPUTE_ZONE} ${JP_CLUSTER_NAME} ${DEV_NAMESPACE}

