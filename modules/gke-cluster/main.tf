# Create GKE Cluster
resource "google_container_cluster" "k8s-cluster" {
    name            = var.cluster_name
    location        = var.location
    network         = var.network_id
    subnetwork      = var.subnetwork
    logging_service = var.logging_service
    networking_mode = var.networking_mode

    node_locations = var.node_locations

    addons_config {
      http_load_balancing {
        disabled = true
      }
      horizontal_pod_autoscaling {
        disabled = true
      }
    }

    release_channel {
      channel = var.release_channel
    }

    workload_identity_config {
      workload_pool = "${var.project_id}.svc.id.goog"
    }

    ip_allocation_policy {
      cluster_secondary_range_name  = var.cluster_secondary_range_name
      services_secondary_range_name = var.services_secondary_range_name
    }

    private_cluster_config {
      enable_private_nodes    = var.enable_private_nodes
      enable_private_endpoint = var.enable_private_endpoint
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
}

# Create Node Pool
resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.k8s-cluster.name
  location   = var.location
  name       = var.primary_node_name
  initial_node_count = var.initial_node_count

  node_config {
    machine_type = var.machine_type
    preemptible  = var.preemptible

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

