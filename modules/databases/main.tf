# Enable Firestore and SQL APIs
resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

resource "google_project_service" "sql_admin" {
  project = var.project_id
  service = "sqladmin.googleapis.com"
}

# Firestore Database (Auth and Notification)
resource "google_firestore_database" "auth_service_db" {
  name        = var.auth_service_db_name
  location_id = var.location
  project     = var.project_id
  type        = "FIRESTORE_NATIVE"
}

resource "google_firestore_database" "reward_service_db" {
  name        = var.reward_service_db_name
  location_id = var.location
  project     = var.project_id
  type        = "FIRESTORE_NATIVE"
}

resource "google_firestore_database" "poe_service_db" {
  name        = var.poe_service_db_name
  location_id = var.location
  project     = var.project_id
  type        = "FIRESTORE_NATIVE"
}

# PostgreSQL Database (Mission)
resource "google_sql_database_instance" "mission_service_instance" {
  name             = var.mission_service_instance_name
  database_version = var.database_version
  region           = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"

    ip_configuration {
        authorized_networks {
          name = var.network_id
          value = "10.0.1.0/24"
        }
      ipv4_enabled    = false
      # private_network = google_compute_subnetwork.private_subnet_4_id
      private_network = var.private_subnet_1
    }
  }
}

resource "google_sql_database" "notification_service_db" {
  name     = var.notification_service_db_name
  instance = google_sql_database_instance.mission_service_instance.name
  }


resource "google_sql_user" "postgres_user" {
  name     = var.postgres_user_name
  instance = google_sql_database_instance.mission_service_instance.name
  password = var.postgres_password
}
