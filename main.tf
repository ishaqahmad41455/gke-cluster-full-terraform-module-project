module "vpc_network" {
  source                        = "./modules/vpc"
  project_id                    = var.project_id
  vpc_network = var.vpc_network
  auto_create_subnetworks = var.auto_create_subnetworks
  region                        = var.region
  routing_mode = var.routing_mode
  mtu = var.mtu
  delete_default_routes_on_create = var.delete_default_routes_on_create

  # Public Subnet Configuration
  ip_cidr_range = var.ip_cidr_range
  public_subnet_name            = var.public_subnet_name
  

  # Private Subnets and Pod IP Ranges
  private_subnet_name_1         = var.private_subnet_name_1
  private_subnet_cidr_1         = var.private_subnet_cidr_1
  pod_range_name_1              = var.pod_range_name_1
  pod_ip_cidr_range_1           = var.pod_ip_cidr_range_1

  private_subnet_name_2         = var.private_subnet_name_2
  private_subnet_cidr_2         = var.private_subnet_cidr_2
  pod_range_name_2              = var.pod_range_name_2
  pod_ip_cidr_range_2           = var.pod_ip_cidr_range_2

  private_subnet_name_3         = var.private_subnet_name_3
  private_subnet_cidr_3         = var.private_subnet_cidr_3
  pod_range_name_3              = var.pod_range_name_3
  pod_ip_cidr_range_3           = var.pod_ip_cidr_range_3

  private_subnet_name_4         = var.private_subnet_name_4
  private_subnet_cidr_4         = var.private_subnet_cidr_4
  pod_range_name_4              = var.pod_range_name_4
  pod_ip_cidr_range_4           = var.pod_ip_cidr_range_4

  private_subnet_name_5         = var.private_subnet_name_5
  private_subnet_cidr_5         = var.private_subnet_cidr_5
  pod_range_name_5              = var.pod_range_name_5
  pod_ip_cidr_range_5           = var.pod_ip_cidr_range_5

  private_subnet_name_6         = var.private_subnet_name_6
  private_subnet_cidr_6         = var.private_subnet_cidr_6
  pod_range_name_6              = var.pod_range_name_6
  pod_ip_cidr_range_6           = var.pod_ip_cidr_range_6

  # NAT and Routing Configuration
  nat_name                      = var.nat_name
  nat_rout_name                 = var.nat_rout_name
  route_name                    = var.route_name
}

module "firewall_rule" {
  source = "./modules/firewall"
  firewall_name = var.firewall_name
  allowed_protocol = var.allowed_protocol
  allowed_ports = var.allowed_ports
  source_ranges = var.source_ranges
  project_id = var.project_id
  network_id = module.vpc_network.vpc_network_id
}

module "gke-cluster" {
  source = "./modules/gke-cluster"
  project_id = var.project_id
  cluster_name = var.cluster_name
  location = var.location
  network_id = module.vpc_network.vpc_network_id
  subnetwork = module.vpc_network.private_subnet_1
  logging_service = var.logging_service
  networking_mode = var.networking_mode
  primary_node_name = var.primary_node_name
  node_locations = var.node_locations
  release_channel = var.release_channel
  workload_pool = var.workload_pool
  cluster_secondary_range_name = var.cluster_secondary_range_name
  enable_private_endpoint = var.enable_private_endpoint
  enable_private_nodes = var.enable_private_nodes
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  deletion_protection = var.deletion_protection
  services_secondary_range_name = var.services_secondary_range_name
  initial_node_count = var.initial_node_count
  machine_type = var.machine_type
  preemptible = var.preemptible
  min_node_count = var.min_node_count
  max_node_count = var.max_node_count
}

module "namespace" {
  source = "./modules/namespaes"
  namespace_names = var.namespace_names
  cluster_name = var.cluster_name
  location = var.location
}

module "database" {
  source = "./modules/databases"
  project_id = var.project_id
  location = var.location
  region = var.region
  auth_service_db_name = var.auth_service_db_name
  database_version = var.database_version
  mission_service_instance_name = var.mission_service_instance_name
  postgres_user_name = var.postgres_user_name
  postgres_password = var.postgres_password
  sql_database_name = var.sql_database_name
  notification_service_db_name = var.notification_service_db_name
  reward_service_db_name = var.reward_service_db_name
  poe_service_db_name = var.poe_service_db_name
  network_id = module.vpc_network.vpc_network_id
  private_subnet_1 = module.vpc_network.private_subnet_1
}

module "shared-resources" {
  source = "./modules/shared-resources"
  project_id = var.project_id
  region = var.region
  redis_instance_name = var.redis_instance_name
  redis_memory_size_gb = var.redis_memory_size_gb
  redis_alt_zone = var.redis_alt_zone
  redis_zone = var.redis_zone
  tier = var.tier
  network_id = module.vpc_network.vpc_network_id
  database_name = var.database_name
}