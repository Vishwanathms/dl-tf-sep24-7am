## Condition operators
ami_id = "${var.env == "prod" ? "ami-0ebfd941bbafe70c6" : "ami-0ebfd941bbafe1234"}"
* count = "${var.vpcenable || var.subnetenable ? 2 :0}

```
count = "${var.vpcenable && var.subnetenable ? 2 :0}
  Result:
    true only if vpcenable=true and subnetenable=true
```

Arthimetic Operators
```
count = "${var.a + var.b == 10 ? 2 : 1}"
```

## Fetching values from the existing resource on aws 

* use "data resource"


## Provisioners -- Local

