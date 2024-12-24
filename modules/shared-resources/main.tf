resource "google_project_service" "redis" {
  project = var.project_id
  service = "redis.googleapis.com"
}

# Redis Instance
resource "google_redis_instance" "redis" {
  name              = var.redis_instance_name
  tier              = var.tier
  memory_size_gb    = var.redis_memory_size_gb
  region            = var.region
  authorized_network = var.network_id

  location_id    = var.redis_zone
  redis_version      = "REDIS_6_X"

  transit_encryption_mode = "SERVER_AUTHENTICATION"

  alternative_location_id = var.redis_alt_zone
  display_name            = "Shared Redis"

   timeouts {
    create = "10m"
    delete = "5m"
   }
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_redis_instance.redis.name
}