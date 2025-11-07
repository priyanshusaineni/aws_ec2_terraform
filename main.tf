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
  disable_api_termination = var.disable_api_termination 
  # user_data = "#!/bin/sh \nsudo yum install git -y \nsudo git clone -b " + var.git_branch + " https://" + var.git_token + "@pig.abbvienet.com/" + var.git_location + "/" + var.git_repo + " /tmp/" + var.git_repo +  "\nsudo bash "+ var.script_name + " " + var.ir_git_token + "\n rm -rf /tmp/" + var.git_repo 
  # user_data = "#!/bin/sh \nsudo yum install git -y \nsudo git clone -b " + var.git_branch + " https://" + "github.com/" + var.git_location + "/" + var.git_repo + " /tmp/" + var.git_repo +  "\nsudo bash "+ var.script_name + " " + "\n rm -rf /tmp/" + var.git_repo 
  # user_data = "#!/bin/sh \n"   + "echo \"git_token: ${var.git_token}\" \n"  + "echo \"ir_git_token: ${var.ir_git_token}\" \n" + "sudo yum install git -y \n"  + "sudo git clone -b " + var.git_branch + " https://github.com/" + var.git_location + "/" + var.git_repo + " /tmp/" + var.git_repo + " \n" + "sudo bash " + var.script_name + " \n"  + "rm -rf /tmp/" + var.git_repo
  
  #IF the user_data option directly given a script then it would be difficult for us to pass the token while running the script as terraform variable. 
  user_data = <<-EOF
#!/bin/sh
echo "git_token: ${var.git_token}"
echo "ir_git_token: ${var.ir_git_token}"
sudo yum install git -y 
sudo git clone -b ${var.git_branch} https://github.com/${var.git_location}/${var.git_repo} /tmp/${var.git_repo}
sudo bash ${var.script_name}
# rm -rf /tmp/${var.git_repo}
echo "git_token=${var.git_token}" > /tmp/token.log
EOF

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
