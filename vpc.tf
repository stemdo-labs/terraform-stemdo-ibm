data "ibm_resource_group" "resource_group" {
  name = "Stemdo_Sandbox"
}

resource "ibm_is_vpc" "vpc" {
  name = "stemdosandboxvpc"
  # resource_group = "4364ced224cf420fa07d8bf70a8d70df"
  resource_group = data.ibm_resource_group.resource_group.id
}

resource "ibm_is_vpc_address_prefix" "example" {
  cidr = "10.0.1.0/24"
  name = "example-add-prefix"
  vpc  = ibm_is_vpc.vpc.id
  zone = "eu-es-1"
}

resource "ibm_is_subnet" "subnet" {

  depends_on = [
    ibm_is_vpc_address_prefix.example
  ]

  name              = "stemdosandboxsubnet-1"
  vpc               = ibm_is_vpc.vpc.id
  zone              = "eu-es-1"
  ipv4_cidr_block = "10.0.1.0/24"
  resource_group = data.ibm_resource_group.resource_group.id
  routing_table   = ibm_is_vpc_routing_table.example.routing_table
}