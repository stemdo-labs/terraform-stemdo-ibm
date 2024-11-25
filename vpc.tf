data "ibm_resource_group" "resource_group" {
  name = "Stemdo_Sandbox"
}

resource "ibm_is_vpc" "vpc" {
  name = "Stemdo_Sandbox_vpc"
  # resource_group = "4364ced224cf420fa07d8bf70a8d70df"
  resource_group = data.ibm_resource_group.resource_group.id
}

resource "ibm_is_subnet" "subnet" {
  name              = "Stemdo_Sandbox_subnet-1"
  vpc               = ibm_is_vpc.vpc.id
  zone              = "eu-es-2"
  ipv4_cidr_block   = "10.10.0.0/24"  # Cambia el rango de IP si es necesario
  # resource_group    = "4364ced224cf420fa07d8bf70a8d70df"
  resource_group = data.ibm_resource_group.resource_group.id
}