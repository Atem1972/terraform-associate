#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd && sudo systemctl enable httpd
echo "<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>" > index.html
sudo mv index.html /var/www/html/