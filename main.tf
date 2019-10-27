#-----------------------------root/main.tf-----------------------------------
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#---------------------------------------------------------------------------
#
provider "aws" {
  region = "${var.aws_region}"
}

module "network-module" {
  source = "./modules/10_networking"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_public_subnet_count = "${var.vpc_public_subnet_count}"
  vpc_public_cidrs = "${var.vpc_public_cidrs}"
  vpc_private_subnet_count = "${var.vpc_private_subnet_count}"
  vpc_private_cidrs = "${var.vpc_private_cidrs}"
  vpc_rds_subnet_count = "${var.vpc_rds_subnet_count}"
  vpc_rds_cidrs = "${var.vpc_rds_cidrs}"
  flowlogs_bucket_name = "${var.flowlogs_bucket_name}"
}
