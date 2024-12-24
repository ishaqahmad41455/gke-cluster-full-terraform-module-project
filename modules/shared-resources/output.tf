output "redis_host" {
  description = "The internal IP address of the Redis instance"
  value       = google_redis_instance.redis.host
}

output "redis_port" {
  description = "The Redis connection port (default is 6379)"
  value       = google_redis_instance.redis.port
}