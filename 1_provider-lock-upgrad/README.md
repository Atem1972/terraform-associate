# Lock and Upgrade Provider Versions

- In this tutorial, you will create a S3 bucket from an initialized Terraform configuration. 
- Then, you will update the Terraform dependency lock file to use the latest version of the AWS provider, and edit the Terraform configuration to conform to the new provider version's requirements.

To manage provider versions, you need to specify the version constraints in your configuration's terraform block.

Remember, when you first run the terraform init command, terraform creates the file called __.terraform.lock.hcl__. This file contains all the plugins versions that was installed automatically.

In the code editor: 
* Open the __.terraform.lock.__ and check the version (__version = "2.50.0"__) of the provider. 
Now let's upgrade this version to (__version = "5.33.0"__)

* Open the __terraform.tf__ file and make sure the required version of the provider is set to (__version = "5.33.0"__). If not, set it.

* Save your changes.

### Upgrade the AWS provider version
The __-upgrade__ flag will upgrade all providers to the latest version specifyed within the version constraints of your configuration.

For the change to occur you need to run the following command:

```
terraform init -upgrade
```
## The lock file instructs Terraform to install the same provider version, ensuring stability across your team or remote sessions.

### Conclusion 

- In this tutorial, we've seen the importance of the __lock file__.
- It's important not to delete this file from the repository so that all developers working on the same code have the same provider version.