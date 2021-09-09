# fins-salesforce-financial-sys-api
Implementation of the FINS Accelerator Salesforce Financial System API specification

### Query Health with Dependencies

The 'get:/ping' endpoint is used to perform a health-check of the 'accelerator-salesforce-financial-sys-api' application.

Same endpoint can be used to perform health-check on the backend system Salesforce also using a query parameter 'checkDependencies' as shown below
get:/ping?checkDependencies=true

The response format is JSON.

### Get Account by Id

The `get:/accounts/(accountId):` endpoint supports retrieval of Financial Accounts (identified by accountId) from Salesforce.

_URI parameters_

- accountId - Unique account id - mandatory

### Query Accounts

The `get:/accounts:` endpoint supports lookup of Financial Accounts from Salesforce using the below Query parameters in the order of their precedence.

_Query parameters_

- externalId: External Id associated with the account
- customerId: Salesforce Customer Id  - optional
- fromDate:  Financial Accounts updated on or after this date and time - optional
- toDate:  Financial Accounts updated on or before this date and time - optional
- limit : optional - default value is 20
- offset : optional - default value is 0

### Create Accounts

The `post:/accounts` endpoint supports creating a new Financial Account in Salesforce. 

The location header in the response includes the Id of the Account created as below

"accounts/0014x00000H7QaoAAF"

### Update Accounts

The 'patch:/accounts/(accountId)' endpoint supports updating details for an existing Financial Account.

The response is a 200 status.

_URI parameters_

- accountId - Unique account id - mandatory

### Query Transactions for Account

The 'get:/accounts/(accountId)/transactions' endpoint supports lookup of Transactions associated with a specific Financial Account.

_URI parameters_

- accountId - Unique account id - mandatory

_Query parameters_

- transactionType: Optional - Filter by transaction type (e.g., DebitTransaction)
- transactionSubType: Optional - Filter by transaction sub-type (e.g., CASH)
- postedDate: Optional - Get all transactions posted on a specific date
- fromDate: Optional - Get transactions created or updated on or after this date and time
- limit : optional - default value is 20
- offset : optional - default value is 0

### Get Transaction by Id

The 'get:/accounts/(accountId)/transactions/(transactionId)' endpoint supports lookup of a specific Transaction for a specific Account

_URI parameters_

- accountId - Unique account id - mandatory
- transactionId - Unique transaction id - mandatory

### Create Transaction

The 'post:/accounts/(accountId)/transactions' endpoint supports creating a new Transaction in Salesforce, associated to an account

The location header in the response includes the Id of the Account created as below

"accounts/0014x00000H7QaoAAF/transactions/0014x00000H7RaoAAF"

_URI parameters_

- accountId - Unique account id - mandatory

### Update Transaction

'patch:/accounts/(accountId)/transactions/(transactionId)' endpoint supports updating details for an existing Financial Account.

The response is a 200 status.

_URI parameters_

- accountId - Unique account id - mandatory
- transactionId - Unique transaction id - mandatory


## Installation instructions for Studio

The following instructions assume you have already configured your Maven 
`settings.xml` file according to the Setup Guide.

- Clone the project using any Github client or Anypoint Studio Git plugin
- Import the project into your workspace
- Modify the `config-local.yaml` properties appropriately
- To run the project, right-click the project and select Run As --> Mule Application