# configured aws provider with proper credentials
provider "aws" {
  region    =  var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

# use data source to get a registered amazon linux 2 ami
data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}  


resource "aws_instance" "ec2_instance" {
  ami             = data.aws_ssm_parameter.ami_id.value
  instance_type          = var.typeinstances
  subnet_id              = aws_default_subnet.default_az1.id
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  key_name               = aws_key_pair.webserver_key.key_name

  #Profisioner using script in the file
  user_data       = fileexists("install_httpd_script.sh") ? file("install_httpd_script.sh") : null
  tags = {
    Name = "Webserver httpd"
  }
}

resource "null_resource" "name" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(local_file.ssh_key.filename)
    host        = aws_instance.ec2_instance.public_ip
  }
  depends_on = [aws_instance.ec2_instance]
}