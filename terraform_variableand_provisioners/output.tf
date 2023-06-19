# print the url of the  server
output "webserver_url" {
  value     = join ("", ["http://", aws_instance.ec2_instance.public_dns, ":", "80"])
}

# print the ssh command of the  server
output "ssh_connection_command" {
  value     = join ("", ["ssh -i webserver_key_pair.pem ec2-user@", aws_instance.ec2_instance.public_dns])
}

# print the timestamp for the execution
output "Time-Date" {
  description = "Date/Time of Execution"
  value       = timestamp()
}