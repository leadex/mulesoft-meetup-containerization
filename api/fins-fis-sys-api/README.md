# fins-fis-sys-api

Implementation of the FINS Accelerator FIS System API specification is used to fetch customer information, their accounts and transactions from FIS.

## Available operations

Query Health with Dependencies
The 'get:/ping' endpoint is used to perform a health-check of the 'fins-fis-sys-api' application.

### Query Customers

The get:/customers endpoint supports retrieval of customers i.e Person (identified by customerId) from FIS.

URI parameters customerId - Unique customer id - mandatory

The get:/customers: endpoint supports lookup of customers (Person) from FIS using the below Query parameters in the order of their precedence. To retrieve list of all customers, no query parameter is passed.

Query parameters

customerId: FIS Customer Id - optional
externalId: externalId of the customer in FIS - optional
emailAddress: email address of customer - optional
limit : optional - default value is 20
offset : optional - default value is 0

*Current implementation only supports lookup by customerId and retrieve list of all customers.*

### Query Accounts

The get:/customers/{customerId}/accounts endpoint supports retrieval of customer's list of financial accounts from FIS.

URI parameters customerId - Unique customer id - mandatory

The get:/customers/{customerId}/accounts/{accountId} endpoint supports retrieval of customer's specific financial account based on accountId from FSC

URI parameters customerId - Unique customer id - mandatory accountId - Unique account id - mandatory

### Query Transactions

The get:/customers/{customerId}/accounts/{accountId}/transactions endpoint supports retrieval of customer's specific financial account's transactions based on accountId from FSC

URI parameters customerId - Unique customer id - mandatory accountId - Unique account id - mandatory

## Installation instructions for Studio

The following instructions assume you have already configured your Maven settings.xml file according to the Setup Guide.

Clone the project using any Github client or Anypoint Studio Git plugin
Import the project into your workspace
Modify the config-local.yaml properties appropriately
To run the project, right-click the project and select Run As --> Mule Application
