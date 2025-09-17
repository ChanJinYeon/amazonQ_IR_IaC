variable "project_name" {
    description = "Project Name"
    type = string
    default = "amazonQ_IR"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zone" {
  type = list(string)
}