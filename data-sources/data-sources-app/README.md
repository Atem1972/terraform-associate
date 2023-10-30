# Learn Terraform data sources

Learn how Terraform data sources help you import data into your Terraform configuration : 

- Terraform data sources let you __dynamically fetch data__ from APIs or other Terraform state backends.
- Examples of data sources include machine image IDs from a cloud provider or Terraform outputs from other configurations
- Data sources make your configuration more flexible and dynamic and let you reference values from other configurations, helping you scope your configuration while still referencing any dependent resource attributes.

### Goal : 
- In this tutorial, you will use data sources to make your configuration more dynamic. 

### Prerequisites
For this tutorial, you will need:
- Terraform v1.2+ installed locally.
- a Terraform Cloud account and organization. [Click here](https://app.terraform.io/public/signup/account?utm_source=learn) to create a Cloud or to login on it if your already have one
- Terraform Cloud locally authenticated. [Click here](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-login) to see the process
- The AWS CLI.
- a Terraform Cloud variable set configured with your AWS credentials.

## Open the Folders
The example configuration for this tutorial is hosted in two Folders : __data-sources-vpc__ and __data-sources-app__ inside the folder called __data-sources__

1. The VPC repository contains the configuration to deploy a VPC and security groups for your application : code in __data-sources-vpc__ folder

2. The application repository contains the configuration to deploy an example application consisting of a load balancer and an EC2 instance : code in __data-sources-app__ 

## Initialize VPC workspace
- Change to the VPC repository directory.
```
cd data-sources-vpc
```
- Set the TF_CLOUD_ORGANIZATION environment variable to your Terraform Cloud organization name. __This will configure your Terraform Cloud integration.__
    * Open your Terraform Cloud account and copy your Organization name
        ![terraform cloud ](../../media/organization.png "CLOUD_ORGANIZATION")

    * Open the Terminal and export your cloud organization name like environment variable. 
        ```
            # export TF_CLOUD_ORGANIZATION=Your_Terraform_Cloud_Organization in my case
            export TF_CLOUD_ORGANIZATION=hermann_company
        ```

Follow along [with this Hashicorp
tutorial](https://developer.hashicorp.com/terraform/tutorials/configuration-language/data-sources).
data-sources