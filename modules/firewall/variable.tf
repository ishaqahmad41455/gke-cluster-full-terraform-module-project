variable "project_id" {
    description = "value"
    type = string
}

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