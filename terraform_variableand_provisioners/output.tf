# print the url of the  server
output "webserver_url" {
  value = aws_instance.ec2_instance.public_dns
}

# print the timestamp for the execution
output "Time-Date" {
  description = "Date/Time of Execution"
  value       = timestamp()
}