variable "bucket_name" {
  type        = string
  description = "Bucket to create for a logging purpose"
  default     = "karthik-log-bucket-2023-03-29"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}