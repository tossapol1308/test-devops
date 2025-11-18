terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("/Users/tossapol/keys/github-actions-devops.json")
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host = google_container_cluster.gke.endpoint

  token = data.google_client_config.default.access_token

  cluster_ca_certificate = base64decode(
    google_container_cluster.gke.master_auth[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host                   = google_container_cluster.gke.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.gke.master_auth[0].cluster_ca_certificate
    )
  }
}
