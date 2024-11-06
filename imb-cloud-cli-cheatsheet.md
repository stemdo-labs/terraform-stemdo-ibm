| Prefijo       | Descripción                                       | Ejemplo de Uso                                                             |
|---------------|------------------------------------------------------------------------|-------------------------------------------------------|
| `is`          | Infrastructure Service - Para gestionar VPC, subredes, volúmenes, etc. | `ibmcloud is vpc-create <nombre_vpc>`                 |
| `cf`          | Cloud Foundry - Gestiona aplicaciones en Cloud Foundry                 | `ibmcloud cf push <nombre_app>`                       |
| `cr`          | Container Registry - Administra contenedores y registros de imágenes   | `ibmcloud cr image-list`                              |
| `ks`          | Kubernetes Service - Comandos para gestionar clústeres de Kubernetes   | `ibmcloud ks cluster-create`                          |
| `target`      | Configuración de entorno, como región y grupo de recursos              | `ibmcloud target -r us-south`                         |
| `resource`    | Administra grupos de recursos y servicios de IBM Cloud                 | `ibmcloud resource service-instances`                 |
| `cos`         | Cloud Object Storage - Comandos para almacenamiento en IBM Cloud       | `ibmcloud cos bucket-create --bucket <nombre_bucket>` |
| `ce`          | Code Engine - Para desplegar aplicaciones sin servidor                 | `ibmcloud ce app create --name <nombre_app>`          |
| `at`          | Activity Tracker - Administra registros de actividad                   | `ibmcloud at events`                                  |
| `fn`          | Functions (Serverless) - Gestiona funciones sin servidor               | `ibmcloud fn action create <nombre_action>`           |
| `iot`         | Internet of Things - Gestiona dispositivos IoT                         | `ibmcloud iot device-create <nombre_device>`          |
| `sql`         | SQL Query - Ejecuta consultas SQL en IBM Cloud                         | `ibmcloud sql query`                                  |
| `schematics`  | Schematics - Gestiona infraestructura como código con Terraform        | `ibmcloud schematics workspace-create`                |
