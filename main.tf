module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"
  count   = var.deploy_module ? 1 : 0

  name                   = var.instance_name
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile
  monitoring             = var.monitoring
  tags                   = var.tags


}

# resource "aws_instance" "example" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   vpc_security_group_ids = var.security_group_ids
#   subnet_id              = var.subnet_id
#   iam_instance_profile   = var.iam_instance_profile
#   monitoring             = true
#   tags                   = var.tags

#   # lifecycle {
#   #   ignore_changes = [
#   #     volume_tags,
#   #     user_data_replace_on_change,
#   #   ]
#   # }
# }

resource "aws_ec2_instance_state" "example_stop" {
  count       = var.deploy_module ? 1 : 0
  instance_id = module.ec2_instance[0].id
  # instance_id = aws_instance.example.id
  state       = var.state
}
