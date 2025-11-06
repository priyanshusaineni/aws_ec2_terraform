output "ec2_instance_id" {
  value = module.ec2_instance[0].id
  description = "The EC2 instance ID from the module"
}

output "git_token" {
  value     = var.git_token
  sensitive = true
}
