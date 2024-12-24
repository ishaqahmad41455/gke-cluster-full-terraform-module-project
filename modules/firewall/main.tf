resource "google_compute_firewall" "rules" {
    name = var.firewall_name
    network = var.network_id
    project = var.project_id

    allow {
      protocol = var.allowed_protocol
      ports = var.allowed_ports
    }

    source_ranges = var.source_ranges
}