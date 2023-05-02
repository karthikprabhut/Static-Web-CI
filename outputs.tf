output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.website_s3_bucket.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.website_s3_bucket.name
}

output "website_bucket_domain" {
  description = "Domain name of the bucket"
  value       = module.website_s3_bucket.domain
}

output "s3_log_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.s3_log_bucket.arn
}

output "s3_log_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.s3_log_bucket.name
}
