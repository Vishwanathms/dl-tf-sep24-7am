## We can place the variables in different .tf file 
* we can have provider.tf -- which will hold provider, terraform -- required_providers
* resources we can place in seperate .tf file
* variables can be placed in different tf file 
* This is not compulsory, this best practise 

## How to provide input variables 

* terraform plan -var vpc_cidr="10.20.0.0/16" -var subnets='["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]' -var vpc_name="vpc1" -var tag_dep="HR" -var tag_owner="Vishwa" -var subnet_name='["Sub1", "sub2", "sub3"]'

* Solution: .tfvars 
* we will add more variables like the tags
* attach variables to all the tags 
* create "terraform.tfvars" file with below input values
```
vpc_cidr="10.20.0.0/16"
subnets=["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"] 
vpc_name="vpc1" 
tag_dep="HR" 
tag_owner="Vishwa" 
subnet_name=["Sub1", "sub2", "sub3"]
```
* and run 
* $ terraform plan
* plan will search for "terraform.tfvars" by default.

* We have name the .tfvars anything and pass the name in the below command. 
* This confirms that we can keep the .tfvars file that the input values anywhere and call the path.
```
terraform plan -var-file="test1.tfvars" 
```

## How to handle the code and input values for multiple environments

* we cannot run multiple .tfvars in the same folder, this would delete the previous created , which is not the right solution
* we want to maintain the "tfstate" file seperately for seperate environment.

* Solution: Workspace
* 

```
terraform workspace new dev -- this will create the workspace
terraform workspace test dev -- this will create the workspace
```

* list the worksapce
```
terraform workspace list 
```
* Commond flow 
```
terraform workspace select dev -- select the workspace
terraform apply -var-file="dev.tfvars"

terraform workspace select test && terraform apply -var-file="test1.tfvars"

```

* to delete an workspace 
```
terraform workspace delete dev
```