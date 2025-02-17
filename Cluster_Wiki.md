# Conexión al clúster de IBM mediante Service ID para Stemdo Wiki

Este documento contiene los pasos necesarios para conectarse al clúster de IBM Cloud utilizando la API Key de un Service ID creado expresamente para el proyecto interno de WIKI.


## 1. Iniciar sesión en la CLI de IBM Cloud

- Instalar la CLI de IBM []()
    ##### Instalación de forma gráfica desde un navegador
    Descarga el paquete correspondiente desde [el repositorio oficial de GitHub de IBM](https://github.com/IBM-Cloud/ibm-cloud-cli-release/releases/)


    ##### Instalación desde la Shell

    - __*MAC*__ : `curl -fsSL https://clis.cloud.ibm.com/install/osx | sh`

    - __*Linux*__ : `curl -fsSL https://clis.cloud.ibm.com/install/linux | sh` 

    - __*Windows Powershell*__ : `iex (New-Object Net.WebClient).DownloadString('https://clis.cloud.ibm.com/install/powershell')`


- Iniciamos sesión con la clave de API mediante `ibmcloud login --apikey <API_KEY>`

## 2. Listar los clústeres para obtener el ID

- Ejecutar el comando `ibmcloud oc cluster ls`
- Copiar el campo `ID`

    ![alt text](image-2.png)

## 3. Obtener la configuración del clúster
- Descargamos la configuración con `ibmcloud oc cluster config -c <ID_CLÚSTER> `

    ![alt text](image-3.png)


## 4. Iniciar sesión en el clúster de OpenShift

- Iniciamos sesión con `oc login -u apikey -p <API_KEY>`

![alt text](image-5.png)





