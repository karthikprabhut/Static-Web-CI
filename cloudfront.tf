resource "aws_cloudfront_distribution" "s3_static_distribution" {
  # provider = aws.us
  origin {
    domain_name = var.website_endpoint
    origin_id   = var.origin_name

  }

  enabled             = true
  default_root_object = "index.html"

  aliases = ["${var.cdn_alias}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id =  var.origin_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

    restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.cert.arn
    ssl_support_method = "sni-only"
  }

  custom_error_response {
    error_caching_min_ttl = 60
    error_code            = 404
    response_page_path    = "/error.html"
    response_code         = 404
  }

   tags = local.common_tags
}