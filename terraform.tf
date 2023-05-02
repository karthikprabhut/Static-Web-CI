terraform {
    backend "s3" {
        bucket          = "demo-state-storage-s3"
        dynamodb_table  = "terraform-state-lock-demo"
        region          = "eu-west-1"
        key             = "project/static-demo-site"
        profile         = "default"
    }
}