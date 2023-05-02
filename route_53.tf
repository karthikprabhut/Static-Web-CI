# A Record entry for static content

data "aws_route53_zone" "route_zone" {
    name = "karthikstack.co.uk"
}

resource "aws_route53_record" "cloudfront_dn" {
    zone_id                = data.aws_route53_zone.route_zone.id
    name                   = data.aws_route53_zone.route_zone.name
    type                   = "A"
    alias {
        name    = aws_cloudfront_distribution.s3_static_distribution.domain_name
        zone_id = aws_cloudfront_distribution.s3_static_distribution.hosted_zone_id
        evaluate_target_health = false
    }
}


