output "vpc_network_id" {
  value = google_compute_network.vpc_network.id 
}

output "public_subnet" {
  value = google_compute_subnetwork.public_subnet.id
}

output "private_subnet_1" {
  value = google_compute_subnetwork.private_subnet_1.id
}

output "private_subnet_2" {
  value = google_compute_subnetwork.private_subnet_2.id
}

output "private_subnet_3" {
  value = google_compute_subnetwork.private_subnet_3.id
}

output "private_subnet_4" {
  value = google_compute_subnetwork.private_subnet_4.id
}

output "private_subnet_5" {
  value = google_compute_subnetwork.private_subnet_5.id
}

output "private_subnet_6" {
  value = google_compute_subnetwork.private_subnet_6.id
}