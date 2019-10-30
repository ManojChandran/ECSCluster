#-------------------20_ecscluster/main.tf-----------------------------------

# Deploy a ECS Cluster
module "ECSCluster" {
  source       = "./modules/40_ECSCluster"
  vpc_id       = "${var.vpc_id}"
  tf_ecs_cluster_name = "${var.vpc_id}-cluster"
}
