resource "aws_s3_bucket" "s3_log_bucket" {
    bucket = var.bucket_name
    tags = var.tags
}

resource "aws_s3_bucket_acl" "s3_log_bucket" {
    bucket = aws_s3_bucket.s3_log_bucket.id
    # acl = "log-delivery-write"
    acl = "private"
    depends_on = [aws_s3_bucket_ownership_controls.s3_log_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_log_bucket_acl_ownership" {
  bucket = aws_s3_bucket.s3_log_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}


# resource "aws_s3_object" "s3_object_bucket" {
#     bucket = aws_s3_bucket.s3_log_bucket.id
#     key    = "logs"
# }

