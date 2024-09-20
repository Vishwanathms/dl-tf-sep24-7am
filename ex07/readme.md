## Condition opration
```
condition ? TRUEVAL : FALSEVAL

```
* the condition operaters are used to return the value based on the condition, for example 
```
count = "${var.env == "prod" ? 2 : 1}"
```
* Example2
```
ami_id = "${var.env == "prod" ? "ami-0ebfd941bbafe70c6" : "ami-0ebfd941bbafe1234"}"
```
* Supporting operators are 
    * Equality : == , !=
    * Numerical comparision: <, > , <=, >=
    * Bollean Logic: &&, ||,  


## Depends on 
* this can be used in resource or modules
* example
```
  depends_on = [ aws_s3_bucket.bucket1 ]
}

resource "aws_s3_bucket" "bucket1" {
    bucket = "vishwa20240920"
  
}
```

## Interpolation
* Variables 
* Resource 
* Data Resource 


## LifeCycle 
* Create_before_destroy  -- create the resource before destroy
    * usage -- true or false
* prevent_destroy        -- this would prevent from destroy 
    * usage -- true or false
* ignore_changes         -- 
```
  lifecycle {
    ignore_changes = [ tags.Name ]
  }
```

## Terraform refresh
* This will check the actual value sin the AWS and if there is any drift in the config, it would update the state file 


## Use case Testing 
  * create EC2 with s3 , added depends_on 
  * Added lifecycle in the ec2 module for "create_before_destory"
  * Added lifecycle in the s3 for ignoring changes to tags.name
  * apply the terraform
  ```
      module.vm01[0].aws_instance.ec2: Creating...
  module.vm01[0].aws_instance.ec2: Still creating... [10s elapsed]
  module.vm01[0].aws_instance.ec2: Creation complete after 16s [id=i-0e66538491ea646ad]
  module.vm01[0].aws_instance.ec2 (deposed object 800cbc7e): Destroying... [id=i-0a9b258eae9ca527c]
  module.vm01[0].aws_instance.ec2: Still destroying... [id=i-0a9b258eae9ca527c, 10s elapsed]
  ```
  * Above is the proof that the instance was first created and then destroyed.
  * Add an tag Name to the VM01 on the AWS portal
  * run "terraform refresh" 
  * Check the state file for that resoruce 
  ```
  terraform state show module.vm01[0].aws_instance.ec2
  ```
  * Lets ftry to do the same for S3 ( rememeber there is lifecycle rule)


