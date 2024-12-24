variable "cluster_name" {
    description = "Name of the GKE cluster"
    type        = string
}

variable "location" {
  description = "Location of the cluster (zone or region)"
  type        = string
}

variable "network_id" {
  description = "Network ID"
  type = string
}

variable "subnetwork" {
  description = "The subnetwork ID where the cluster will be created."
  type        = string
}

variable "logging_service" {
  description = "The logging service used by the cluster."
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

variable "networking_mode" {
  description = "Networking mode for the cluster."
  type        = string
#   default     = "VPC_NATIVE"
}

variable "node_locations" {
  description = "List of locations for node locations."
  type        = list(string)
}

variable "release_channel" {
  description = "The release channel for the cluster."
  type        = string
}

variable "workload_pool" {
  description = "The workload identity pool to attach to the cluster."
  type        = string
}

variable "cluster_secondary_range_name" {
  description = "Secondary IP range for pods."
  type        = string
}

variable "services_secondary_range_name" {
  description = "Secondary IP range for services."
  type        = string
}

variable "enable_private_nodes" {
  description = "Enable private nodes in the cluster."
  type        = bool
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint in the cluster."
  type        = bool
}

variable "master_ipv4_cidr_block" {
  description = "IPv4 CIDR block for the master."
  type        = string
}

variable "deletion_protection" {
  description = "Enable deletion protection for the cluster."
  type        = bool
}

variable "initial_node_count" {
    description = "Initial node count"
    type = number
}

# Node Configuration Variables
variable "machine_type" {
  type = string
  description = "The machine type for the node pool"
  default = "n1-standard-1"
}

variable "preemptible" {
  type = bool
  description = "If true, nodes in the node pool are preemptible"
  default = false
}

# Autoscaling Variables
variable "min_node_count" {
  type = number
  description = "Minimum number of nodes in the node pool"
  default = 1
}

variable "max_node_count" {
  type = number
  description = "Maximum number of nodes in the node pool"
  default = 3
}

variable "project_id" {
    description = "value"
    type = string
}

variable "primary_node_name" {
  
}