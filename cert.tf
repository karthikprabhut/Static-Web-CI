resource "aws_acm_certificate" "cert" {
  provider = aws.us    
  domain_name       = data.aws_route53_zone.route_zone.name
  validation_method = "DNS"
  tags = local.common_tags
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  provider = aws.us 
  name    = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
  zone_id = "${data.aws_route53_zone.route_zone.id}"
  records = [tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value]
  ttl     = 60
}


resource "aws_acm_certificate_validation" "cert_validate" {
  provider = aws.us 
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]
}