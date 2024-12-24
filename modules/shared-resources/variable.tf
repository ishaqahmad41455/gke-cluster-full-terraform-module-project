variable "project_id" {
  description = "The ID of the project in GCP"
  type        = string
}

variable "redis_instance_name" {}
variable "tier" {}

variable "region" {
  description = "The region to deploy resources in GCP"
  type        = string
}

variable "redis_memory_size_gb" {
  description = "Redis instance memory size in GB"
  type        = number
 }

variable "network_id" {
  description = "The VPC network name"
  type        = string
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