resource "google_artifact_registry_repository" "docker_repo" {
  location      = var.region
  repository_id = "test-devops-images"
  description   = "Docker images for test-devops"
  format        = "DOCKER"
}
