## Topics Covered 
* terraform backend using s3
* Locking the statefile using DynamoDB


## How to make sure the state file is safe.

* Solution: we can use "backend"
* The statefile can be stored in any of the options like, s3, gcp, azurerm"
* The statefile does not have to follow the same account and region of the resrouce created.
* 
Sample code
```
terraform {
  backend "s3" {
    key = "devopsb3/terraform-dev.tfstate"
    bucket = "vishwa23082024"
    region = "us-east-1"
    profile = "specnet-tf-aug-vms"
    encrypt = true
  }
}
```

## Note: -- there is one problem with the remote statefile using S3.
* The file does not get locked, due to which more than one devops engg can run the terraform apply on the same statefile at the same time.

* Solution:
* Steps:
  * Create dynamo DB table on the aws 
  ```
  aws dynamodb create-table \
    --table-name terraform-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
  ```
  * add the below in the backend
  ```
      dynamodb_table = "terraform-lock-table"
  ```

