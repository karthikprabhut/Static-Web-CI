module "website_s3_bucket" {
  source          = "./modules/aws-s3-static-content"
  bucket_name     = "karthik-stack-web"
  log-bucket_name = "karthik-log-bucket-2023-03-29"
  tags         = local.common_tags
}


module "s3_log_bucket" {
  source       = "./modules/aws-s3-log-bucket"
  bucket_name  = "karthik-log-bucket-2023-03-29"
  tags         = local.common_tags
}