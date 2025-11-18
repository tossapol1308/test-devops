variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  default     = "asia-southeast1"
}

variable "gke_cluster_name" {
  type        = string
  default     = "test-devops-gke"
}

variable "network_name" {
  type        = string
  default     = "test-devops-vpc"
}

variable "subnet_name" {
  type        = string
  default     = "test-devops-subnet"
}

variable "app_secret_value" {
  type        = string
  sensitive   = true
  description = "Example secret stored in Secret Manager"
}
