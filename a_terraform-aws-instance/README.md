# With Terraform installed, you are ready to create your first infrastructure.

- In this tutorial, you will provision an EC2 instance on Amazon Web Services (AWS). 
- EC2 instances are virtual machines running on AWS, and a common component of many infrastructure projects.

## Prerequisites

To follow this tutorial you will need:

- The Terraform CLI (1.2.0+) installed.
- The AWS CLI installed and configured.
- AWS account and associated credentials that allow you to create resources.

## Write configuration

- You will write your first configuration to define a single AWS EC2 instance.
- Each Terraform configuration must be in its own working directory. 
1. Create a directory for your configuration.
    ```mkdir a_terraform-aws-instance
    ```

2. Change into the directory.
    ```cd a_terraform-aws-instance
    ```

3. Create a file to define your infrastructure, using code command if you have Virtual code installed.
    ```code main.tf
    ```
Open __main.tf__ in your text editor, paste in the configuration below, and save the file.

    ```
        terraform {
            required_providers {
                aws = {
                    source  = "hashicorp/aws"
                    version = "~> 4.16"
                }
            }

            required_version = ">= 1.2.0"
        }

        provider "aws" {
            region  = "us-west-2"
        }

        resource "aws_instance" "app_server" {
            ami           = "ami-830c94e3"
            instance_type = "t2.micro"

            tags = {
                Name = "ExampleAppServerInstance"
            }
        }
    ```
- This is a complete configuration that you can deploy with Terraform. 
- The following sections review each block of this configuration in more detail.

## Terraform Block
- __The terraform {}__ block contains Terraform settings, including the required providers Terraform will use to provision your infrastructure. 
- For each provider, the source attribute defines an optional hostname, a namespace, and the provider type. 
- Terraform installs providers from the Terraform Registry by default. 
- In this example configuration, the aws provider's source is defined as hashicorp/aws, which is shorthand for registry.

## Providers
- The provider block configures the specified provider, in this case aws. 
- A provider is a plugin that Terraform uses to create and manage your resources.

__Note:__ You can use multiple provider blocks in your Terraform configuration to manage resources from different providers. 
- You can even use different providers together. 
- __For example:__, you could pass the IP address of your AWS EC2 instance to a monitoring resource from __DataDog__.

## Resources
- Use resource blocks to define components of your infrastructure. 
- A resource might be a physical or virtual component such as an __EC2 instance__, or it can be a logical resource such as a __Heroku application__.

## initialize the directory
- When you create a new configuration — or check out an existing configuration from version control 
-  you need to initialize the directory with terraform init.
- Initializing a configuration directory downloads and installs the providers defined in the configuration, which in this case is the aws provider.

#### Initialize the directory.
    ```terraform init
    ```
- Terraform downloads the aws provider and installs it in a hidden subdirectory of your current working directory, named __.terraform__. 
- The terraform init command prints out which version of the provider was installed. 
- Terraform also creates a __lock file__ named __.terraform.lock.hcl__ which specifies the exact provider versions used, so that you can control when you want to update the providers used for your project.

## Format and validate the configuration : 
1. __terraform fmt command__
- We recommend using consistent formatting in all of your configuration files. 
- The __terraform fmt__ command __automatically updates configurations__ in the current directory for __readability__ and __consistency__.

    ```
    terraform fmt
    ```
2. __terraform validate command__
- You can also make sure your configuration is syntactically valid and internally consistent by using the terraform validate command.
- Validate your configuration.
    ```
    terraform validate
    ```

## Create infrastructure : terraform apply command
- Apply the configuration now with the terraform apply command. 
- Terraform will print output similar to what is shown below. 
- We have truncated some of the output to save space.
    ```
    terraform apply
    ```
- Terraform will now pause and wait for your approval before proceeding.

## Inspect state
- When you applied your configuration, Terraform wrote data into a file called __terraform.tfstate__. 
- Terraform stores the IDs and properties of the resources it manages in this file, so that it can update or destroy those resources going forward.
- The __Terraform state file__ is the only way Terraform can __track which resources__ it manages, and often contains __sensitive information__, so you __must store your state file securely__ and __restrict access__ to only trusted team members who need to manage your infrastructure. 
- In production, we recommend storing your state __remotely with Terraform Cloud or Terraform Enterprise__. 
- Terraform also supports several other remote backends you can use to store and manage your state.

#### Inspect the current state using terraform show.
    ```
    terraform show
    ```

- When Terraform created this EC2 instance, it also gathered the resource's metadata from the AWS provider and wrote the metadata to the state file. 
- In later tutorials, you will modify your configuration to reference these values to configure other resources and output values.

## Manually Managing State

- Terraform has a built-in command called __terraform state__ for advanced state management. 
- Use the list subcommand to list of the resources in your project's state.
    ```
    terraform state list
    ```

## Troubleshooting

- If terraform validate was successful and your apply still failed, you may be encountering one of these common errors.

    * If you use a region other than __us-west-2__, you will also need to change your __ami__, since AMI IDs are region-specific. 
    * Choose an AMI ID specific to your region by following [these instructions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html#finding-quick-start-ami), and modify __main.tf__ with this ID. 
    * Then re-run __terraform apply__.

    * If you do not have a default VPC in your AWS account in the correct region, navigate to the AWS VPC Dashboard in the web UI, create a new VPC in your region, and associate a subnet and security group to that VPC. 
    * Then add the security group ID (vpc_security_group_ids) and subnet ID (subnet_id) arguments to your aws_instance resource, and replace the values with the ones from your new security group and subnet.
    
    ```
    resource "aws_instance" "app_server" {
    ami                    = "ami-830c94e3"
    instance_type          = "t2.micro"
    vpc_security_group_ids = ["sg-0077..."]
    subnet_id              = "subnet-923a..."
    }
    ```
- Save the changes to main.tf, and re-run terraform apply.
- Remember to add these lines to your configuration for later tutorials