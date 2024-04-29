variable "region_name" {
  type        = string
  description = "Region name"
}

variable "server_type" {
  type        = string
  description = "server type"
}

variable "source_path_file" {
  type        = string
  description = "path of the key locally"
}

variable "destination_path_file" {
  type        = string
  description = "path of the destination"

}

variable "ssh_port" {
  type        = number
  description = "ssh port"
}

variable "verified_email" {
  type = string
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "private_subnet_cidr" {
  type        = string
  description = "private subnet cidr"
}

variable "private_subnet_cidr_2" {
  type        = string
  description = "private subnet cidr 2"
}

variable "public_subnet_cidr" {
  type        = string
  description = "public subnet cidr"
}









