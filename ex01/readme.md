## Terraform basics

* provider will specificy the particular cloud provider 
  * pass region, access key and scert key

* Example for a resource 
```
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
```
* this would create an VPC with the given CIDR in that particular region

## Terraform Commands.

* $ terraform init -- this will initialize the provider and get the binary for execution
* $ terraform validate -- this would validate the syntax of the terraform code 
* $ terraform plan -- Plan is like a dry run, this would go to AWS with the given credentials, and check if the mentioned resoruce can be created or not.
* $ terraform apply -- this would create the resrouce and update the state file ( which maintains the end state of the resource created)
* $ terrraform destroy -- tit would cleanup al lthe resource that was created on the provider (aws)
