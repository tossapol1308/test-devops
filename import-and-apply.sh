#!/bin/bash

# Navigate to terraform directory
cd /Users/tossapol/Documents/test-ptteps/test-devops/infra/terraform

# Import existing VPC network
terraform import \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  google_compute_network.vpc \
  projects/test-devops-478606/global/networks/test-devops-vpc

echo "VPC imported successfully"

# Now apply the rest of the infrastructure
terraform apply \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  -target="google_compute_subnetwork.subnet" \
  -target="google_container_cluster.gke" \
  -target="google_container_node_pool.primary_nodes" \
  -auto-approve