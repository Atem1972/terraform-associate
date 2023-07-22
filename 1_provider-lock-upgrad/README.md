# Lock and Upgrade Provider Versions

- In this tutorial, you will create a S3 bucket from an initialized Terraform configuration. 
- Then, you will update the Terraform dependency lock file to use the latest version of the AWS provider, and edit the Terraform configuration to conform to the new provider version's requirements.

There are two ways for you to manage provider versions in your configuration.

1. Specify provider version constraints in your configuration's terraform block.
2. Use the dependency lock file


1. In the "Code Editor" tab, open the main.tf file.

Copy and paste the following configuration. Save your changes by clicking on the icon next to the filename above the editor window.

## The lock file instructs Terraform to always install the same provider version, ensuring that consistent runs across your team or remote sessions.

### Upgrade the AWS provider version
The __-upgrade__ flag will upgrade all providers to the latest version consistent within the version constraints specified in your configuration.

Upgrade the AWS provider.

```
terraform init -upgrade
```

### Conclusion 

- In this tutorial, we've seen the importance of the lock file, which is used to update provider versions. 
- It's important not to delete this file from the repository so that all developers working on the same code have the same provider version.