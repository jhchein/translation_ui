# translation_ui

A proof of concept user interface for Text, Document, and Speech translation.

- Build the docker image
- Push to a docker registry (e.g. ACR)
- Deploy a container app using this image
  - allow ingress
  - map to port 80
- set the secrets
  - storage_account_key
  - storage_account_name
  - translator_blob_sas_token
  - translator_resource_key
  - translator_resource_name
