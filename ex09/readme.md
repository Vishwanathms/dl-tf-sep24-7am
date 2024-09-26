## Assumption
* You have the s3 bucket to store the state files
* Key pair is already created 
* Secruity group is created with ports, 22 & 80 inbound opened
* make sure if you are using the ec2 moudle, the module is also updated with above variables.

## Provisioners -- Remote
* Install nginx after the EC2 instance is created 

* Components
  * connection function
  * provisioners remote 

## create tfvars for the root module 


