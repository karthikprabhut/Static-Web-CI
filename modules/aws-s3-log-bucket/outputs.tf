output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_log_bucket.arn
}

output "name" {
  description = "Name or id of the bucket"
  value       = aws_s3_bucket.s3_log_bucket.id
}