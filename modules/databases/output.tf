output "auth_service_db_name" {
  value = google_firestore_database.auth_service_db.name
}

output "reward_service_db_name" {
  value = google_firestore_database.reward_service_db.name
}

output "poe_service_db_name" {
  value = google_firestore_database.poe_service_db.name
}

output "notification_service_db_name" {
  value = google_sql_database_instance.mission_service_instance.name
}

output "mission_service_instance_name" {
  value = google_sql_database_instance.mission_service_instance.name
}

output "mission_db_name" {
  value = google_sql_database_instance.mission_service_instance.name
}