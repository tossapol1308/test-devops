resource "google_secret_manager_secret" "app_secret" {
  secret_id = "test-devops-app-secret"
  replication {
     auto {}
  }
}

resource "google_secret_manager_secret_version" "app_secret_version" {
  secret      = google_secret_manager_secret.app_secret.id
  secret_data = var.app_secret_value
}
