#!/bin/bash
set -e

echo "Current directory: $(pwd)"
echo "Changing to terraform directory..."

cd "/Users/tossapol/Documents/test-ptteps/test-devops/infra/terraform"

echo "New directory: $(pwd)"
echo "Listing terraform files..."
ls -la *.tf

echo "Running terraform apply..."
terraform apply \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  -auto-approve

echo "Terraform apply completed!"