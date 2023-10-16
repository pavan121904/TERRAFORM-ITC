output "web_instance_public_ip" {
  value = module.ec2_instance.public_ip
}

output "asg_id" {
  value = module.auto_scaling.asg_id
}
