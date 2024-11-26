resource "ibm_resource_instance" "cos_instance" {
  name     = "my_cos_instance"
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "global"
  resource_group_id = data.ibm_resource_group.resource_group.id
}

resource "ibm_container_vpc_cluster" "example_openshift" {
  name                = "stemdo_os_cluster"
  kube_version        = "4.16.19_openshift"                         # Especifica la versión de OpenShift
  # hardware          = "shared"                                    # Usar nodos dedicados (dedicated) o compartidos (shared)
  # worker_pool_name  = "default"
  worker_count        = "3"                                         # Número de nodos trabajadores
  flavor              = "mx2.4x32"                                  # Tipo de máquina de los nodos
  # zone              = "eu-es-2"                                   # Zona donde se creará el clúster
  vpc_id              = ibm_is_vpc.vpc.id                           # ID de la VPC
  # subnet_ids        = [ibm_is_subnet.subnet.id]                   # Subnet de la VPC
  tags                = ["terraform", "ibm", "openshift"]
  cos_instance_crn  = ibm_resource_instance.cos_instance.id
  resource_group_id   = data.ibm_resource_group.resource_group.id
  zones {
      subnet_id = ibm_is_subnet.subnet.id
      name      = "eu-es-1"
    }
}
