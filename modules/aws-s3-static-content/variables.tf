variable "bucket_name" {
  description = "Name of the S3 bucket. Must be unique."
  type        = string
  default     = "karthik-static-bucket-2023-03-28"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}


variable "log-bucket_name" {
  description = "Bucket name for Logging"
  default     = "karthik-log-bucket-2023-03-29"
}