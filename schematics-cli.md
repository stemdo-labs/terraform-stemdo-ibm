### Listar los workspace de Schematics
```
$ibmcloud schematics workspace list
```
### Obtener detalles sobre un workspace en concreto
``` 
$ibmcloud schematics workspace list get --id <IDWORKSPACE>
```
### Descargar tfstate
``` 
$ibmcloud schematics state pull -id <IDWORKSPACE> --template <IDTEMPLATE>

$ibmcloud schematics state pull -id <IDWORKSPACE> --template <IDTEMPLATE> >> tfstate.json
```