variable "project_id" {}

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

variable "private_subnet_1" {
  
}


variable "location" {
  description = "The location for the Firestore database"
  type        = string
}

variable "region" {
  description = "The region for the PostgreSQL database"
  type        = string
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

# variable "subnetwork" {
#   description = "The subnetwork ID where the cluster will be created."
#   type        = string
# }

# variable "private_subnet_id" {
#   type = string
# }

# variable "private_subnet_2_id" {
#   type = string
# }

# variable "private_subnet_3_id" {
#   type = string
# }

# variable "vpc_network" {
#     description = "VPC network"
#     type = string
# }

variable "network_id" {
  description = "The ID of the VPC network"
  type        = string
}