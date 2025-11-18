output "gke_cluster_name" {
  value = google_container_cluster.gke.name
}

output "gke_endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.docker_repo.repository_id
}

# output "argocd_namespace" {
#   value = kubernetes_namespace.argocd.metadata[0].name
# }
