output "database_endpoint" {
  description = "The endpoint of the RDS database."
  value       = aws_db_instance.rds_database.endpoint
}
