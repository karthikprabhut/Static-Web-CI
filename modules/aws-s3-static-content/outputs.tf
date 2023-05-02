output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_demo_bucket.arn
}

output "name" {
  description = "Name or id of the bucket"
  value       = aws_s3_bucket.s3_demo_bucket.id
}

output "domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket_website_configuration.s3_demo_bucket.website_domain
}

output "endpoint" {
  description = "Endpoint name of the bucket"
  value       = aws_s3_bucket.s3_demo_bucket.website_endpoint
}

output "zoneid" {
  description = "Zone ID of the bucket"
  value       = aws_s3_bucket.s3_demo_bucket.hosted_zone_id
}