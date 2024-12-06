variable "availability_zone_a" {
  type        = string
  description = "Subnet availability zone A"
  default     = "eu-central-1a"
}

variable "availability_zone_b" {
  type        = string
  description = "Subnet availability zone B"
  default     = "eu-central-1b"
}

variable "private_subnet_cidr_a" {
  type        = string
  description = "CIDR of private subnet A"
  default     = "192.168.2.0/24"
}

variable "private_subnet_cidr_b" {
  type        = string
  description = "CIDR of private subnet B"
  default     = "192.168.3.0/24"
}

variable "proxy_ami" {
  type        = string
  description = "Proxy Jump AMI"
  default     = "ami-066902f7df67250f8" #ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20241120
}

variable "proxy_instance_type" {
  type        = string
  description = "Proxy Jump instance type"
  default     = "t3.micro"
}

variable "public_subnet_cidr_a" {
  type        = string
  description = "CIDR of public subnet A"
  default     = "192.168.0.0/24"
}

variable "public_subnet_cidr_b" {
  type        = string
  description = "CIDR of public subnet B"
  default     = "192.168.1.0/24"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-central-1"
}

variable "use_spot_instance" {
  type        = bool
  description = "If spot instances should be used instead of on demand"
  default     = false
}

variable "worker_instance_type" {
  type        = string
  description = "EKS node group instance type"
  default     = "t3.xlarge"
}

variable "worker_group" {
  type = object({
    min_size     = number
    max_size     = number
    desired_size = number
    }
  )
  description = "Size of EKS node group"
  default = {
    min_size     = 1
    max_size     = 2
    desired_size = 1
  }
}
