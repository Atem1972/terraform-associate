# Learn Terraform sensitive input variables

## Security : Protect sensitive input variables

- Often you need to configure your infrastructure using __sensitive__ or __secret__ information such as __usernames__, __passwords__, __API tokens__, or __Personally Identifiable Information (PII)__. 
- When you do so, you need to ensure that you do not accidentally expose this data in CLI output, log output, or source control. 
- Terraform provides several features to help avoid accidentally exposing sensitive data.

# Goal 
- In this tutorial, you will use Terraform to deploy a web application 
- on AWS, including a VPC, load balancer, EC2 instances, and a database. 
- You will replace the database's __hard-coded__ credentials with variables configured with the __sensitive flag__. 
- Terraform will then redact these values in the output of Terraform commands or log messages. 
- Next, you will set values for these variables using environment variables and with a __.tfvars__ file. 
- Finally, you will identify the sensitive values in state, and learn about ways to protect your state file.

## Create infrastructure
- Change to the repository directory.

 ```cd sensitive-variables
 ```
- This configuration defines a web application, __including a VPC__, __load balancer__, __EC2 instances__, and a __database__.



This repo is a companion repo to the [Learn Terraform sensitive input variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables) tutorial.
It contains Terraform configuration you can use to learn how Terraform sensitive input variables help you manage sensitive information.
