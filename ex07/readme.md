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
