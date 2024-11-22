resource "ibm_container_cluster" "example_openshift" {
  name             = "example-openshift-cluster"
  kube_version     = "openshift-4.12_openshift"  # Especifica la versión de OpenShift
  hardware         = "dedicated"                # Usar nodos dedicados (dedicated) o compartidos (shared)
  worker_pool_name = "default"
  worker_count     = 1                          # Número de nodos trabajadores
  flavor           = "b3c.4x16"                 # Tipo de máquina de los nodos
  zone             = "uksouth"               # Zona donde se creará el clúster
  vpc_id           = ibm_is_vpc.vpc.id                 # ID de la VPC
  subnet_ids       = [ibm_is_subnet.subnet.id]            # Subnet de la VPC
  tags             = ["terraform", "ibm", "openshift"]
}
