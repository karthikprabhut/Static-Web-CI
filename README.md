# static-demo-site

This is a sample project to demonstrate the static website backed by S3 content deployed via terraform custom module. To acheive the secured connection Amazon cloudfront is used to serve a static website hosted on Amazon S3.

## Static Host

https://karthikstack.co.uk

## Usage

main.tf        -  Contains bucket provisioning via modules.

local.tf       -  Common tags to maintain the resource.

version.tf     -  AWS provider version and terraform version.

variables.tf   -  contains environmental variables.

terraform.tf   -  Remote backend S3 information.

provider.tf    -  AWS provider with Alias information. (Specifically - Certs should be maintanined in us-east-1 region  
                  as per the coloudfront distribution requirement)

outputs.tf     -  To display output for the resources which created.

cloudfront.tf  -  Cloufront distribution for backed S3 as a state website endpoint.

cert.tf        -  acm creation for the cloudfront distribution to access webpage securely. 

route_53.tf    -  Routing infomation for the existing hosted zone.


## Pipeline Execution:

- Stage `terraform validate` to check the project and its dependencies

- Execute `terraform plan` to plan the infrastructure

- Execute `terraform apply` to provision the infrastructure

