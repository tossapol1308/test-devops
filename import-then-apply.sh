#!/bin/bash
set -e

cd "/Users/tossapol/Documents/test-ptteps/test-devops/infra/terraform"

echo "Importing existing GCP resources..."

# Import existing VPC network
echo "Importing VPC network..."
terraform import \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  google_compute_network.vpc \
  projects/test-devops-478606/global/networks/test-devops-vpc || echo "VPC already imported or does not exist"

echo "Running terraform apply to create remaining resources..."
terraform apply \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  -auto-approve