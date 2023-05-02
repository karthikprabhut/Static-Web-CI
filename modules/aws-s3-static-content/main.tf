resource "aws_s3_bucket" "s3_demo_bucket" {
    bucket = var.bucket_name
    tags = var.tags
}

resource "aws_s3_bucket_ownership_controls" "s3_demo_bucket_acl_ownership" {
  bucket = aws_s3_bucket.s3_demo_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
    # object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_demo_access_block" {
  bucket = aws_s3_bucket.s3_demo_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "s3_demo_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_demo_bucket_acl_ownership,
    aws_s3_bucket_public_access_block.s3_demo_access_block,
  ]
    bucket = aws_s3_bucket.s3_demo_bucket.id

    acl = "public-read-write"
    # depends_on = []
}

resource "aws_s3_bucket_website_configuration" "s3_demo_bucket" {
    bucket = aws_s3_bucket.s3_demo_bucket.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_object" "s3-demo-object-upload" {
    for_each        = fileset("${path.module}/uploads", "*.html")
    bucket          = aws_s3_bucket.s3_demo_bucket.id
    key             = each.value
    source          = "${path.module}/uploads/${each.value}"
    content_type    = "text/html"
    # acl             = "public-read"
}

resource "aws_s3_bucket_policy" "s3_demo_bucket" {
    bucket = aws_s3_bucket.s3_demo_bucket.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "PublicReadGetObject"
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject"
                Resource = [
                    aws_s3_bucket.s3_demo_bucket.arn,
                    "${aws_s3_bucket.s3_demo_bucket.arn}/*",
                ]
            },
        ]
    })
}

# resource "aws_s3_object" "s3-demo-object-img-upload" {
#     for_each        = fileset("${path.module}/uploads", "*.jpeg")
#     bucket          = aws_s3_bucket.s3_demo_bucket.id
#     key             = each.value
#     source          = "${path.module}/uploads/${each.value}"
#     content_type    = "image/jpeg"
#     acl             = "public-read"
# }

 resource "aws_s3_bucket_logging" "s3-demo-logging" {
    bucket          = aws_s3_bucket.s3_demo_bucket.id
    target_bucket   = var.log-bucket_name
    target_prefix   = "logs/"

 }

