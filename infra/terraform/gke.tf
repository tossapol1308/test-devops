resource "google_container_cluster" "gke" {
  name                      = var.gke_cluster_name
  location                  = var.region
  network                   = google_compute_network.vpc.name
  subnetwork                = google_compute_subnetwork.subnet.name
  remove_default_node_pool  = true
  initial_node_count        = 1

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  ip_allocation_policy {}

  release_channel {
    channel = "REGULAR"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-nodes"
  location   = var.region
  cluster    = google_container_cluster.gke.name

  node_config {
    machine_type = "e2-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  initial_node_count = 2
}
