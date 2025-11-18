#!/bin/bash

# Navigate to terraform directory
cd /Users/tossapol/Documents/test-ptteps/test-devops/infra/terraform

# Apply terraform with required variables
terraform apply \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  -auto-approve