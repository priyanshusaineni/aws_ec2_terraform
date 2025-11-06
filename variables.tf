variable "instance_name" {
  description = "Name tag for the EC2 instances"
  type        = string
  default     = "my-ec2-instance"
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be launched"
  type        = string
}

variable "iam_instance_profile" {
    description = "IAM instance profile to launch the instance with."
    type = string
}

variable "monitoring" {
    description = "Enable or Disabling Monitoring"
    type = bool
}

variable "state" {
    description = "State to be set for the instance"
    type = string
}
variable "ebs_block_devices" {
  description = "List of EBS block devices to attach to the EC2 instance"
  type = list(object({
    device_name           = string
    name                  = string
    volume_size           = number
    volume_type           = string
    delete_on_termination = bool
    encrypted             = bool
    iops                  = optional(number)
  }))
  default = []
}


variable "tags" {
  description = "Tags to apply to the instances"
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "ARCH"
    Owner       = "ARCH-Platform"
    CostCenter  = "615110"
    Purpose     = ""
    CreatedBy   = "ARCH-Platform-Engineering"
  }
}

variable deploy_module {
  description = "To check whether the module code needs to be executed or not"
  type = bool
}

variable "git_branch" {
  description = "Name of the branch"
  type = string
}

variable "git_repo" {
  description = "Name of the repository"
  type = string
}

variable "git_location" {
  description = "Name of the git Location"
  type = string
}

variable "script_name" {
  description = "Location of the script"
  type = string
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
}

variable "git_token" {
  description = "Git authentication token"
  type        = string
  sensitive   = true
}

variable "ir_git_token" {
  description = "IR git authentication token"
  type        = string
  sensitive   = true
}
