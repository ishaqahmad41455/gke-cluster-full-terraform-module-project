resource "google_project_service" "my-project-service" {
  project = var.project_id  
  service = "compute.googleapis.com"
}

resource "google_project_service" "service_networking" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}

resource "google_project_service" "container" {
    project = var.project_id
    service = "container.googleapis.com"
}

resource "google_compute_network" "vpc_network" {
    project = var.project_id
    name = var.vpc_network
    routing_mode = var.routing_mode
    auto_create_subnetworks = var.auto_create_subnetworks
    mtu = var.mtu

    delete_default_routes_on_create = var.delete_default_routes_on_create
}

resource "google_compute_subnetwork" "public_subnet" {
    name = var.public_subnet_name
    ip_cidr_range = var.ip_cidr_range
    region = var.region
    network = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private_subnet_1" {
  name          = var.private_subnet_name_1
  ip_cidr_range = var.private_subnet_cidr_1
  network       = google_compute_network.vpc_network.id
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name_1
    ip_cidr_range = var.pod_ip_cidr_range_1
  }
}

resource "google_compute_subnetwork" "private_subnet_2" {
  name          = var.private_subnet_name_2
  ip_cidr_range = var.private_subnet_cidr_2
  network       = google_compute_network.vpc_network.id
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name_2
    ip_cidr_range = var.pod_ip_cidr_range_2
  }
}

resource "google_compute_subnetwork" "private_subnet_3" {
  name          = var.private_subnet_name_3
  ip_cidr_range = var.private_subnet_cidr_3
  network       = google_compute_network.vpc_network.id
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name_3
    ip_cidr_range = var.pod_ip_cidr_range_3
  }
}

resource "google_compute_subnetwork" "private_subnet_4" {
  name          = var.private_subnet_name_4
  ip_cidr_range = var.private_subnet_cidr_4
  network       = google_compute_network.vpc_network.id
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name_4
    ip_cidr_range = var.pod_ip_cidr_range_4
  }
}

resource "google_compute_subnetwork" "private_subnet_5" {
  name          = var.private_subnet_name_5
  ip_cidr_range = var.private_subnet_cidr_5
  network       = google_compute_network.vpc_network.id
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name_5
    ip_cidr_range = var.pod_ip_cidr_range_5
  }
}

resource "google_compute_subnetwork" "private_subnet_6" {
  name          = var.private_subnet_name_6
  ip_cidr_range = var.private_subnet_cidr_6
  network       = google_compute_network.vpc_network.id
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod_range_name_6
    ip_cidr_range = var.pod_ip_cidr_range_6
  }
}

resource "google_compute_global_address" "private_services_connection" {
  name          = "private-services-connection"
  network       = var.vpc_network
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_services_connection.name]
}

resource "google_compute_address" "nat" {
  name         = var.nat_name
  address_type = "EXTERNAL"
  region       = var.region
  project      = var.project_id
  depends_on   = [
    google_compute_subnetwork.private_subnet_1,
    google_compute_subnetwork.private_subnet_2,
    google_compute_subnetwork.private_subnet_3,
    google_compute_subnetwork.private_subnet_4,
    google_compute_subnetwork.private_subnet_5,
    google_compute_subnetwork.private_subnet_6
    ]
}

resource "google_compute_router" "nat_rout" {
  name    = var.nat_rout_name
  network = var.vpc_network
}

resource "google_compute_router_nat" "route" {
  name = var.nat_name
  router = var.route_name
  region = var.region
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option = "AUTO_ONLY"
  project = var.project_id

  subnetwork {
    name                       = google_compute_subnetwork.private_subnet_1.id  
    source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                       = google_compute_subnetwork.private_subnet_2.id
    source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                       = google_compute_subnetwork.private_subnet_3.id
    source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                       = google_compute_subnetwork.private_subnet_4.id
    source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                       = google_compute_subnetwork.private_subnet_5.id
    source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                       = google_compute_subnetwork.private_subnet_6.id
    source_ip_ranges_to_nat    = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
