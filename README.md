# translation UI (Work in progress)

A proof of concept user interface for Text, Document, and Speech translation.

![UI](assets/UI.jpg)

## current state

The app works, but needs manual creation of Azure resources and manual setting of environment secrets.

## ToDos

### Infra Deployment

Use Bicep to deploy or update Resource Group, Storage account, Translator Resource, ACR, Key vault, Web App (SKU B1). Use MSI or service principal for access to resources. Set environment variables. Make use of deployment slots (dev, prod).

Create a service principal for Web App Deployment.

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
  - set the github secrets
  - store credentials in key vault
  - storage_account_key
  - storage_account_name
  - translator_blob_sas_token
  - translator_resource_key
  - translator_resource_name
  - registry_username
  - registry_password
  - AZURE_CREDENTIALS
