#-----------------10_networking/outputs.tf------------------

output "VPC-ID" {
  value = "${module.vpc_igw.vpc_id}"
}
output "VPC-IGW" {
  value = "${module.vpc_igw.igw_id}"
}
output "VPC-Default-Routetable" {
  value = "${module.vpc_igw.default_route_table_id}"
}
output "Public-subnets" {
  value = ["${module.PublicSubnet.vpc_public_subnets}"]
}
output "Private-subnets" {
  value = ["${module.PrivateSubnet.vpc_private_subnets}"]
}
output "RDS-subnets" {
  value = ["${module.RDSSubnet.vpc_RDS_subnets}"]
}
#output "VPC-Flowlogs" {
#  value = "${module.Flowlogs.tf_VPC_flowlogs_id}"
#}
