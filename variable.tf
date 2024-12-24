# VPC

variable "project_id" {}
variable "vpc_network" {}
variable "public_subnet_name" {}
variable "ip_cidr_range" {}
variable "region" {}

variable "private_subnet_name_1" {}
variable "private_subnet_cidr_1" {}
variable "pod_range_name_1" {}
variable "pod_ip_cidr_range_1" {}

variable "private_subnet_name_2" {}
variable "private_subnet_cidr_2" {}
variable "pod_range_name_2" {}
variable "pod_ip_cidr_range_2" {}

variable "private_subnet_name_3" {}
variable "private_subnet_cidr_3" {}
variable "pod_range_name_3" {}
variable "pod_ip_cidr_range_3" {}

variable "private_subnet_name_4" {}
variable "private_subnet_cidr_4" {}
variable "pod_range_name_4" {}
variable "pod_ip_cidr_range_4" {}

variable "private_subnet_name_5" {}
variable "private_subnet_cidr_5" {}
variable "pod_range_name_5" {}
variable "pod_ip_cidr_range_5" {}

variable "private_subnet_name_6" {}
variable "private_subnet_cidr_6" {}
variable "pod_range_name_6" {}
variable "pod_ip_cidr_range_6" {}

variable "nat_name" {}
variable "nat_rout_name" {}
variable "route_name" {}
variable "mtu" {}
variable "delete_default_routes_on_create" {}
variable "routing_mode" {}
variable "auto_create_subnetworks" {}

//////////////////////////////////////////////////////////////////////

# Firewall
variable "firewall_name" {
    description = "Name of the firewall rule"
    type = string   
}

variable "allowed_protocol" {
  description = "Protocol allowed by the firewall rule"
  type        = string
}

variable "allowed_ports" {
  description = "Ports allowed by the firewall rule"
  type        = list(string)
}

variable "source_ranges" {
  description = "Source ranges allowed to connect"
  type        = list(string)
}

variable "network_id" {
  description = "The ID of the VPC network"
  type        = string
}

/////////////////////////////////////////////////////////////////////////////////

# GKE CLUSTER
variable "cluster_name" {
    description = "Name of the GKE cluster"
    type        = string
}

variable "location" {
  description = "Location of the cluster (zone or region)"
  type        = string
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

variable "primary_node_name" {
  
}

////////////////////////////////////////////////////////////////////////////

# Namespaces

variable "namespace_names" {
  type        = list(string)
  description = "List of namespace names to create."
}

/////////////////////////////////////////////////////////////////////////////

# Databasaes
variable "auth_service_db_name" {
    description = "Auth DB Name"
    type = string
}

variable "reward_service_db_name" {
    description = "Auth DB Name"
    type = string
}

variable "poe_service_db_name" {
    description = "Auth DB Name"
    type = string
}

variable "notification_service_db_name" {
    description = "Notification DB Name"
    type = string
  #   validation {
  #   condition     = length(var.notification_db_name) >= 4 && length(var.notification_db_name) <= 63 && can(regex("[a-z0-9-]+", var.notification_db_name))
  #   error_message = "Notification DB name must be 4-63 characters long and contain only lowercase letters, numbers, and hyphens."
  # }
    
}

variable "database_version" {
    description = "Database Version"
    type = string
}

variable "mission_service_instance_name" {
    description = "Postgres instance Name"
    type = string
}

variable "postgres_password" {
  description = "The password for the PostgreSQL user"
  type        = string
}

variable "sql_database_name" {
    description = "SQL Dtabase Name"
    type = string
}

variable "postgres_user_name" {
    description = "Postgres User Name"
    type = string
}

variable "private_subnet_1" {
  description = "The ID of the first private subnet"
  type        = string
}


/////////////////////////////////////////////////////////////////////////////////

variable "redis_instance_name" {}

variable "tier" {}

variable "redis_memory_size_gb" {
  description = "Redis instance memory size in GB"
  type        = number
}


variable "redis_zone" {
  description = "The primary zone for Redis"
  type        = string
}

variable "redis_alt_zone" {
  description = "The alternative zone for Redis (for high availability)"
  type        = string
}

variable "database_name" {
  
}