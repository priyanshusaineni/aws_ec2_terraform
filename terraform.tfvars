ami                 = "ami-0bdd88bd06d16ba03"
instance_type       = "t3.small"
# instance_name       = "my-ec2"
key_name            = "aws_ec2_key_pair"
security_group_ids  = ["sg-0a0cd5e4d1514e045"]
subnet_id           = "subnet-004aa68bfe70a7672"
monitoring             = true
state       = "running"
iam_instance_profile = null
ebs_block_devices = [
  {
    device_name           = "/dev/sdf"
    name                  = "ebs01"
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = false
  }
]
tags = {
  Name        = "terraform-test-instance"
  Environment = "production"
  Owner       = "DevOps Team"
  Owner       = "ARCH-Platform"
  CostCenter  = "615110"
  Purpose     = ""
  CreatedBy   = "ARCH-Platform-Engineering"
}
deploy_module = true