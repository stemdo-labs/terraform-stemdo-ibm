locals {
  BASENAME = "terratest"
  ZONE     = "uksouth"
}

resource "ibm_is_vpc" "vpc" {
  name = "${local.BASENAME}-vpc"
  resource_group = "4364ced224cf420fa07d8bf70a8d70df"
}

resource "ibm_is_subnet" "subnet" {
  name              = "subnet-1"
  vpc               = ibm_is_vpc.vpc.id
  zone              = "uksouth"
  ipv4_cidr_block   = "10.10.0.0/24"  # Cambia el rango de IP si es necesario
  resource_group    = "4364ced224cf420fa07d8bf70a8d70df"
}

# resource "ibm_is_security_group" "sg1" {
#   name = "${local.BASENAME}-sg1"
#   vpc  = ibm_is_vpc.vpc.id
# }
# 
# # allow all incoming network traffic on port 22
# resource "ibm_is_security_group_rule" "ingress_ssh_all" {
#   group     = ibm_is_security_group.sg1.id
#   direction = "inbound"
#   remote    = "0.0.0.0/0"
# 
#   tcp {
#     port_min = 22
#     port_max = 22
#   }
# }
# 
# # allow all incoming network traffic on port 54321/54322
# resource "ibm_is_security_group_rule" "ingress_h2o_all" {
#   group     = ibm_is_security_group.sg1.id
#   direction = "inbound"
#   remote    = "0.0.0.0/0"
# 
#   tcp {
#     port_min = 54321
#     port_max = 54322
#   }
# }
# 
# # allow all outcoming network traffic on all ports
# resource "ibm_is_security_group_rule" "ingress_out_all" {
#   group     = ibm_is_security_group.sg1.id
#   direction = "outbound"
#   remote    = "0.0.0.0/0"
# 
#   tcp {
#     port_min = 1
#     port_max = 65535
#   }
# }
# 
# resource "ibm_is_public_gateway" "terra_aut_gateway" {
#     name = "testgateway"
#     vpc = ibm_is_vpc.vpc.id
#     zone = "us-south-1"
# }
# 
# resource "ibm_is_subnet" "subnet1" {
#   name                     = "${local.BASENAME}-subnet1"
#   vpc                      = ibm_is_vpc.vpc.id
#   zone                     = local.ZONE
#   total_ipv4_address_count = 256
#   public_gateway = ibm_is_public_gateway.terra_aut_gateway.id
# }
# 
# data "ibm_is_ssh_key" "ssh_key_id" {
#   name = var.ssh_key
# }
# 
# resource "ibm_is_instance" "vsi1" {
#   name    = "${local.BASENAME}-vsi1"
#   image   = data.ibm_is_image.ds_image.id
#   vpc     = ibm_is_vpc.vpc.id
#   zone    = local.ZONE
#   keys    = [data.ibm_is_ssh_key.ssh_key_id.id]
#   profile = "cx2-4x8"
# 
#   primary_network_interface {
#     subnet          = ibm_is_subnet.subnet1.id
#     security_groups = [ibm_is_security_group.sg1.id]
#   }
# }
# 
# resource "ibm_is_instance" "vsi2" {
#   name    = "${local.BASENAME}-vsi2"
#   image   = data.ibm_is_image.ds_image.id
#   vpc     = ibm_is_vpc.vpc.id
#   zone    = local.ZONE
#   keys    = [data.ibm_is_ssh_key.ssh_key_id.id]
#   profile = "cx2-4x8"
# 
#   primary_network_interface {
#     subnet          = ibm_is_subnet.subnet1.id
#     security_groups = [ibm_is_security_group.sg1.id]
#   }
# }
# 
# resource "ibm_is_floating_ip" "fip1" {
#   name   = "${local.BASENAME}-fip1"
#   target = ibm_is_instance.vsi1.primary_network_interface[0].id
# }
# 
# resource "ibm_is_floating_ip" "fip2" {
#   name   = "${local.BASENAME}-fip2"
#   target = ibm_is_instance.vsi2.primary_network_interface[0].id
# }
# 
# output "host_1" {
#   value = ibm_is_floating_ip.fip1.address
# }
# 
# output "host_2" {
#   value = ibm_is_floating_ip.fip2.address
# }