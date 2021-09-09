# accelerator-salesforce-customers-sys-api
Implementation of the Accelerator Salesforce Customers System API specification


### Query Health with Dependencies

The 'get:/ping' endpoint is used to perform a health-check of the 'accelerator-salesforce-customers-sys-api' application.

Same endpoint can be used to perform health-check on the backend system Salesforce also using a query parameter 'checkDependencies' as shown below
get:/ping?checkDependencies=true

The response format is JSON.

### Query customers

The `get:/customers/(customerId):` endpoint supports retrieval of customers i.e Accounts and Person Accounts (identified by customerId) from Salesforce.

_URI parameters_

- customerId - Unique customer id - mandatory

The `get:/customers:` endpoint supports lookup of customers (Person Accounts and Accounts) from Salesforce using the below Query parameters in the order of their precedence.

_Query parameters_

- customerId: Salesforce Customer Id  - optional
- externalId: Global_Customer_Id__c of the customer in Salesforce - optional
- emailAddress: email address of customer
- beginTime:  customers updated on or after this date and time - optional
- endTime:  customers updated on or before this date and time - optional
- limit : optional - default value is 50
- offset : optional - default value is 0

### Create customers

The `post:/customers` endpoint supports creating a new Customer (Person Account or Account based on the partyType) in Salesforce. 

The location header in the response includes the Id of the Customer created as below

"customers/0014x00000H7QaoAAF"

### Update customers

The patch:/customers/(customerId): endpoint supports updating details for an existing customer.

The response payload is the complete customer details (after update) in JSON format.

### Query related contacts

The `get:/customers/{customerId}/relatedContacts` endpoint supports retrieval of all related contacts for a customer from Salesforce.

_URI parameters_

- customerId - Unique customer id - mandatory

### Upsert related contacts

The `put:/customers/{customerId}/relatedContacts` endpoint supports upserting a set of related contacts for a customer in Salesforce.

### Query contacts

The `get:/contacts/(contactId):` endpoint supports retrieval of contacts (identified by contactId) from Salesforce.

_URI parameters_

- contactId - Unique contact id - mandatory

The `get:/contacts:` endpoint supports lookup of contacts from Salesforce using the below Query parameters in the order of their precedence.

_Query parameters_

- contactId: Salesforce Contact Id  - optional
- externalId: Global_Individual_Id__c of the contact in Salesforce - optional
- emailAddress: email address of the contact

### Create contacts

The `post:/contacts` endpoint supports creating a new Contact in Salesforce. 

The location header in the response includes the Id of the Contact created as below

"contacts/0014x00000H7QaoAAF"

### Update contact

The patch:/contacts/(contactId): endpoint supports updating details for an existing contacts.

The response payload is the complete contact details (after update) in JSON format.

## Installation instructions for Studio

The following instructions assume you have already configured your Maven 
`settings.xml` file according to the Setup Guide.

- Clone the project using any Github client or Anypoint Studio Git plugin
- Import the project into your workspace
- Modify the `config-local.yaml` properties appropriately
- To run the project, right-click the project and select Run As --> Mule Application


