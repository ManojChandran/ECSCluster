#--------------------10_networking/variables.tf----------------------

variable "vpc_cidr" {}
variable "vpc_id" {
  default = ""
}
variable "vpc_igw_id" {
  default = ""
}
variable "vpc_route_table_id" {
  default = ""
}
variable "vpc_public_subnet_count" {}
variable "vpc_public_cidrs" {
  type = "list"
}
variable "vpc_private_subnet_count" {}
variable "vpc_private_cidrs" {
  type = "list"
}
variable "vpc_rds_subnet_count" {}
variable "vpc_rds_cidrs" {
  type = "list"
}
variable "flowlogs_bucket_name" {
  default = ""
}
