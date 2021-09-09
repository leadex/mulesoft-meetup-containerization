# fins-salesforce-financial-exp-api

The FINS Salesforce Financial Experience API provides support for Salesforce 
Financial Services Cloud.

## Available operations

### Trigger account sync process

The `post:\accounts\poller` endpoint will trigger the account sync process.

## Dependencies

This API relies on the FINS Bank Accounts Process API to perform the sync.

## Installation instructions for Studio

The following instructions assume you have already configured your Maven 
`settings.xml` file according to the Setup Guide.

- Clone the project using any Github client or Anypoint Studio Git plugin
- Import the project into your workspace
- Modify the `config-local.yaml` properties appropriately
- To run the project, right-click the project and select Run As --> Mule Application
