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
* example3

