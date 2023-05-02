variable "region" {
  type = string
  default = "eu-west-1"
}

variable "website_endpoint" {
  type = string
  default = "karthik-stack-web.s3.eu-west-1.amazonaws.com"
}

variable "origin_name" {
  type = string
  default = "karthik-stack-web.s3.eu-west-1.amazonaws.com"
}

variable "cdn_alias" {
  type = string
  default = "karthikstack.co.uk"
}