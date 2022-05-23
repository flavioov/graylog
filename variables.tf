variable "ocean_id" {
  type        = string
  default     = "o-6d4fdcd2"
  description = "Spotinst cluster ID at spotinst"
}

variable "eks_name" {
  type        = string
  default     = "eks-devops-prod-002"
  description = "Kubernetes cluster Name"
}

variable "desired_capacity" {
  type        = number
  default     = "3"
  description = "Kubernetes Node desired capacity"
}

variable "max_size" {
  type        = number
  default     = "5"
  description = "Kubernetes Node max_size capacity"
}

variable "min_size" {
  type        = number
  default     = "2"
  description = "Kubernetes Node min_size capacity"
}


variable "iam_instance_profile" {
  type        = string
  default     = "arn:aws:iam::152112667370:instance-profile/eks-devops-prod-00220211231144115439500000002"
  description = "Iam Node Instance Profile"
}

# see ami optimized for eks https://docs.aws.amazon.com/eks/latest/userguide/eks-optimized-ami.html
# each reagion has its best ami
variable "ami" {
  type        = string
  default     = "ami-00836a7940260f6dd"
  description = "An AMI that is compatible with your desired version of kubernetes."
}

variable "subnet_ids" {
  type        = list(string)
  default     = ["subnet-097bf2b40d7a8cc7f", "subnet-09b55e4cdc8274dcd", "subnet-0a4795ad0ced1d7f1"]
  description = "A list of security groups where instances will be provisioned"
}

variable "security_groups" {
  type        = list(string)
  default     = ["sg-0bfdea5fe3eb0fea8", "sg-0028a90e2bedda717"]
  description = "Scecurity Group Ids"
}
