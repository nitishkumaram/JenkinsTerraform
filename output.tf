# Output Values of different resources
output "EC2IP" {
  value = aws_instance.JenkinsEc2.public_ip
}

# Print the URL of the Jenkins
output "JenkinsURL" {
  value = join ("",["http://", aws_instance.JenkinsEc2.public_dns, ":","8080"])
}