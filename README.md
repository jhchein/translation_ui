# translation_ui

A proof of concept user interface for Text, Document, and Speech translation.

- [x] Fix requirements (streamlit)
- do i need the conda env at all?
- 

- Infra

  - Resource Group
  - Storage account
  - Translator Resource
  - ACR
  - Key vault
  - web app (B1)

- Create a service principal:

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

- set the github secrets
  - store credentials in key vault
    - registry username and password
  - storage_account_key
  - storage_account_name
  - translator_blob_sas_token
  - translator_resource_key
  - translator_resource_name
  - registry_username
  - registry_password
  - AZURE_CREDENTIALS
- ~~Build the docker image~~
- ~~Push to a docker registry (e.g. ACR)~~
- Deploy a container app using this image
  - allow ingress
  - map to port 80
