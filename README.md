# translation ui (wip) 

A proof of concept user interface for Text, Document, and Speech translation (still missing). 

## current state

The app works, but needs manual creation of Azure resources and manual setting of environment secrets.

## ToDos

- Add speech translation
- Infra deployment
  - Resource Group
  - Storage account
  - Translator Resource
  - ACR
  - Key vault
  - web app (B1)
- Authentication via MSI or Service Pricincipal
  - Create a service principal

  ```CLI
  az ad sp create-for-rbac --name "myApp" --role contributor \
  --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
  --sdk-auth
  ```

  and copy the JSON output similar to this:

  ```JSON
  {
    "clientId": "<GUID>",
    "clientSecret": "<STRING>",
    "subscriptionId": "<GUID>",
    "tenantId": "<GUID>",
    "resourceManagerEndpointUrl": "<URL>"
    (...)
  }
  ```

  - Automatically set the github secrets and or store credentials in key vault
    - registry username and password
    - storage_account_key
    - storage_account_name
    - translator_blob_sas_token
    - translator_resource_key
    - translator_resource_name
    - registry_username
    - registry_password
    - AZURE_CREDENTIALS
