#!/bin/bash

# Navigate to terraform directory
cd /Users/tossapol/Documents/test-ptteps/test-devops/infra/terraform

# First, create infrastructure only (no kubernetes/helm resources)
terraform apply \
  -var="project_id=test-devops-478606" \
  -var="app_secret_value=xit;y9bLkl9iN" \
  -target="google_compute_network.vpc" \
  -target="google_compute_subnetwork.subnet" \
  -target="google_container_cluster.gke" \
  -target="google_container_node_pool.primary_nodes" \
  -target="google_artifact_registry_repository.docker_repo" \
  -target="google_secret_manager_secret.app_secret" \
  -target="google_secret_manager_secret_version.app_secret_version" \
  -auto-approve