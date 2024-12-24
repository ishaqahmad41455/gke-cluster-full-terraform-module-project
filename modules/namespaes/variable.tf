variable "namespace_names" {
  type        = list(string)
  description = "List of namespace names to create."
}

variable "cluster_name" {
    description = "Name of the GKE cluster"
    type        = string
}

variable "location" {
  description = "Location of the cluster (zone or region)"
  type        = string
}