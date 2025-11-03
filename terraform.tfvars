ami                 = "ami-0bdd88bd06d16ba03"
instance_type       = "t3.micro"
instance_name       = "my-ec2"
key_name            = "ec2trainingkeypair"
security_group_ids  = ["sg-00183383692392c6e"]
subnet_id           = "subnet-05a4a9a8a82c14411"
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