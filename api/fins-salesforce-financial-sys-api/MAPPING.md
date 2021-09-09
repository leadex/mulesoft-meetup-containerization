# filteredTransactions

# generic-success-response
This module produces a generic success response.

# ping-check-dependency-sys-api-response

# accounts-create-response-headers
This module returns a Location header containing the path to retrieve the Account.

# accounts-patch-to-sf
This module produces a SF FinancialAccount update.

## Mapping Tables

Maps a single FINS Account to a list with a single SF Financial Account 

> | Salesforce Financial Account | FINS | Description | 
> | ---- |---- |---- |
> | id | id | SF internal ID of the Account | 
> | Global_Account_Id | externalIds[0].externalId | FINS external id of the Account | 
> | FinServ__PrimaryOwner__c | customerId | SF internal ID of the Person Account who owns this Financial Account | 
> | CurrencyIsoCode | accountCurrency | ISO Currency code used by the Account | 
> | FinServ__TaxID__c | identificationNumber | Tax Identification Number of the Account | 
> | FinServ__Balance__c | accountBalance |  Balance of the Account | 
> | FinServ__FinancialAccountType__c | accountType | Type of Account | 
> | FinServ__Nickname__c | accountLabel | Personalized name of the Account | 
> | FinServ__CashBalance__c | availableBalance | Available balance of the Account  | 
> | FinServ__OpenDate__c | openedDate | Date the Account was opened | 
> | FinServ__CloseDate__c | closedDate | Date the Account was closed | 
> | FinServ__FinancialAccountNumber__c | accountNumber | Number of the Account | 
> | FinServ__Status__c | accountStatus | Current status of the Account | 
> | Name | name | Official name of the Account | 


# accounts-post-transaction-request

# accounts-search-sql-params
This component generates a parameterized SOQL WHERE clause as a String, containing conditions for each provided optional query parameter.
It also includes LIMIT and OFFSET clauses.

## Variables

__var__ `conditions`
> A list of the SOQL conditions for filtering records, based on the provided optional parameters. The conditions are joined with AND operators.

# transaction-response-header

# accounts-get-transaction-by-id-to-canonical
This transformation produces a list of canonical FINS Transactions from a SF Financial Account Transaction list

## Mapping Tables

Maps a list of SF Financial Accounts to a FINS Account 

> | FINS | Salesforce Financial Account Transaction | Description | 
> | ---- |---- |---- |
> | id | Id |  ID of the Transaction | 
> | externalIds[].externalId | Global_Account_Id__c | External ID of the Account | 
> | name | Name | Name of the Transaction | 
> | description | FinServ__Description__c | Description of the Transaction | 
> | amount | FinServ__Amount__c | Total amount of the Transaction | 
> | transactionDate | FinServ__TransactionDate__c | Date the Transaction occurred | 
> | transactionType | FinServ__TransactionType__c | Type of the Transaction | 
> | transactionSubType | FinServ__TransactionSubtype__c | Subtype of the Transaction | 
> | transactionStatus | FinServ__TransactionStatus__c | Status of the Transaction | 
> | postedDate | FinServ__PostDate__c | Date the Transaction was processed and settled | 
> | isDisputed | FinServ__IsDisputed__c | Whether the Transaction is disputed | 
> | disputedReason | FinServ__DisputeReason__c | Why the Transaction is disputed | 
> | auditInfo.createdDate | CreatedDate | Datetime when the Transaction record was internally created | 
> | auditInfo.createdBy | CreatedById | User which created the Transaction | 
> | auditInfo.updatedBy | LastModifiedById | User which last modified the Transaction | 
> | auditInfo.updatedDate | LastModifiedDate | Datetime when the Transaction was last modified | 


# accounts-get-by-id-to-canonical-response
This transformation produces a single canonical FINS Account from a SF Financial Account

## Mapping Tables

Maps a single SF Financial Accounts to a FINS Account 

> | FINS | Salesforce Financial Account | Description | 
> | ---- |---- |---- |
> | id | id | SF internal ID of the Account | 
> | externalIds[].externalId | Global_Account_Id__c | External ID of the Account | 
> | accountCurrency | CurrencyIsoCode | ISO Currency code used by the Account | 
> | identificationNumber | FinServ__TaxID__c | Tax Identification Number of the Account | 
> | accountBalance | FinServ__Balance__c |  Balance of the Account | 
> | accountType | FinServ__FinancialAccountType__c | (enum) Type of Account | 
> | accountLabel | FinServ__Nickname__c | Personalized name of the Account | 
> | availableBalance | FinServ__CashBalance__c | Available balance of the Account  | 
> | openedDate | FinServ__OpenDate__c | Date the Account was opened | 
> | closedDate | FinServ__CloseDate__c | Date the Account was closed | 
> | accountNumber | FinServ__FinancialAccountNumber__c | Number of the Account | 
> | accountStatus | FinServ__Status__c | Current status of the Account | 
> | name | Name | Official name of the Account | 
> | primaryAccountOwner | FinServ__PrimaryOwner__c | Customer who is the primary owner of the account | 
> | createdDate | CreatedDate | Date the Account record was created in the system | 
> | createdBy | CreatedById | System user who created the Account | 
> | updatedDate | LastModifiedDate | Date the Account was last modified by a system user | 
> | updatedBy | LastModifiedById | System user who last modified the Account | 


# accounts-get-transactions-to-canonical
This transformation produces a list of canonical FINS Transactions from a SF Financial Account Transaction list

## Mapping Tables

Maps a list of SF Financial Accounts to a FINS Account 

> | FINS | Salesforce Financial Account Transaction | Description | 
> | ---- |---- |---- |
> | id | Id |  ID of the Transaction | 
> | externalIds[].externalId | Global_Account_Id__c | External ID of the Account | 
> | name | Name | Name of the Transaction | 
> | description | FinServ__Description__c | Description of the Transaction | 
> | amount | FinServ__Amount__c | Total amount of the Transaction | 
> | transactionDate | FinServ__TransactionDate__c | Date the Transaction occurred | 
> | transactionType | FinServ__TransactionType__c | Type of the Transaction | 
> | transactionSubType | FinServ__TransactionSubtype__c | Subtype of the Transaction | 
> | transactionStatus | FinServ__TransactionStatus__c | Status of the Transaction | 
> | postedDate | FinServ__PostDate__c | Date the Transaction was processed and settled | 
> | isDisputed | FinServ__IsDisputed__c | Whether the Transaction is disputed | 
> | disputedReason | FinServ__DisputeReason__c | Why the Transaction is disputed | 
> | auditInfo.createdDate | CreatedDate | Datetime when the Transaction record was internally created | 
> | auditInfo.createdBy | CreatedById | User which created the Transaction | 
> | auditInfo.updatedBy | LastModifiedById | User which last modified the Transaction | 
> | auditInfo.updatedDate | LastModifiedDate | Datetime when the Transaction was last modified | 


# AccountsTools
THis module provides utility functions and mappings for FINS Account transformations

## Variables

__var__ `sfAccountTypeMap`
> This map is used by the conversion functions below.
__var__ `finsAccountTypeMap`
> This map is used by the conversion function below.
__var__ `sfAccountStatusMap`
> This map is used by the conversion function below.
__var__ `finsAccountStatusMap`
> This map is used by the conversion function below.
__var__ `sfTransactionTypeMap`
> This map is used by the conversion function below.
__var__ `sfTransactionSubtypeMap`
> This map is used by the conversion function below.
__var__ `sfTransactionStatusMap`
> This map is used by the conversion function below.
__var__ `sfTransactionDisputedReasonMap`
> This map is used by the conversion function below.

## Functions

__fun__ `sfAccountTypeToFins` ( __sfAccountType__)

> __return__ FINS Account Type   
> 
> Maps from SF FinancialAccount FinancialAccountType to a FINS Account child type 

__fun__ `finsAccountTypeToSf` ( __finsAccountType__)

> __return__ SF FinancialAccountType   
> 
> Map from FINS Account Subtype to a SF FinancialAccount FinancialAccountType 

__fun__ `sfAccountStatusToFins` ( __sfAccountStatus__)

> __return__ FINS Transaction Subtype (enum)   
> 
> Maps from SF FinancialAccount Status to a FINS Account Status enum 

__fun__ `finsAccountStatusToSf` ( __finsAccountStatus__)

> __return__ SF FinancialAccountType   
> 
> Map from FINS Account Status to a SF FinancialAccount Status 

__fun__ `sfTransactionTypeToFins` ( __sfTransactionType__)

> __return__ FINS Transaction Type (RAML type)   
> 
> Maps from SF FinancialAccountTransaction TransactionType to a FINS Transaction child type 

__fun__ `cimTransactionTypeToSF` ( __sfTransactionType__)

> __return__ CIM Transaction Type (SF type)   
> 
> Maps from CIM FinancialAccountTransaction TransactionType to a SF Transaction child type 

__fun__ `sfTransactionSubtypeToFins` ( __sfTransactionSubtype__)

> __return__ FINS Transaction Subtype (enum)   
> 
> Maps from SF FinancialAccountTransaction TransactionSubType to a FINS TransactionSubtype enum 

__fun__ `sfTransactionStatusToFins` ( __sfTransactionStatus__)

> __return__ FINS Transaction Type   
> 
> Maps from SF FinancialAccountTransaction TransactionStatus to a FINS TransactionStatus enum 

__fun__ `sfTransactionDisputedReasonToFins` ( __sfTransactionDisputedReason__)

> __return__ FINS Transaction Type   
> 
> Maps from SF FinancialAccountTransaction TransactionDisputedReason to a FINS TransactionDisputedReason enum 

__fun__ `finsTransactionDisputedReasonToSf` ( __finsTransactionDisputedReason__)

> __return__ SF Transaction Type   
> 
> Maps from a FINS TransactionDisputedReason enum to SF FinancialAccountTransaction TransactionDisputedReason 

__fun__ `getFormattedDateTime` ( __datetimeToFormat__)


> Formats a given SF datetime to a canonical datetime


# accounts-patch-transaction-to-sf
This module produces a SF FinancialAccount update.

## Mapping Tables

Maps a single FINS Transaction to a SF Financial Account Transaction 

> | Salesforce Financial Account | FINS | Description | 
> | ---- |---- |---- |
> | id | id | SF internal ID of the Transaction | 
> | FinServ__IsDisputed__c | isDisputed | Whether the Transaction is disputed | 
> | FinServ__DisputeReason__c | disputedReason | Why the Transaction is disputed | 


# accounts-create-to-sf
This module produces a SF FinancialAccount creation.

## Mapping Tables

Maps a single FINS Account to a list with a single SF Financial Account 

> | Salesforce Financial Account | FINS | Description | 
> | ---- |---- |---- |
> | externalIds[0].externalId | Global_Account_Id | FINS external id of the Account | 
> | FinServ__PrimaryOwner__c | customerId | SF internal ID of the Person Account who owns this Financial Account | 
> | CurrencyIsoCode | accountCurrency | ISO Currency code used by the Account | 
> | FinServ__TaxID__c | identificationNumber | Tax Identification Number of the Account | 
> | FinServ__Balance__c | accountBalance |  Balance of the Account | 
> | FinServ__FinancialAccountType__c | accountType | Type of Account | 
> | FinServ__Nickname__c | accountLabel | Personalized name of the Account | 
> | FinServ__CashBalance__c | availableBalance | Available balance of the Account  | 
> | FinServ__OpenDate__c | openedDate | Date the Account was opened | 
> | FinServ__CloseDate__c | closedDate | Date the Account was closed | 
> | FinServ__FinancialAccountNumber__c | accountNumber | Number of the Account | 
> | FinServ__Status__c | accountStatus | Current status of the Account | 
> | Name | name | Official name of the Account | 


# accounts-search-to-canonical-response
This transformation produces a list of canonical FINS Accounts from a SF Financial Account list

## Mapping Tables

Maps a list of SF Financial Accounts to a FINS Account 

> | FINS | Salesforce Financial Account | Description | 
> | ---- |---- |---- |
> | id | id | SF internal ID of the Account | 
> | externalIds[].externalId | Global_Account_Id__c | External ID of the Account | 
> | accountCurrency | CurrencyIsoCode | ISO Currency code used by the Account | 
> | identificationNumber | FinServ__TaxID__c | Tax Identification Number of the Account | 
> | accountBalance | FinServ__Balance__c |  Balance of the Account | 
> | accountType | FinServ__FinancialAccountType__c | (enum) Type of Account | 
> | accountLabel | FinServ__Nickname__c | Personalized name of the Account | 
> | availableBalance | FinServ__CashBalance__c | Available balance of the Account  | 
> | openedDate | FinServ__OpenDate__c | Date the Account was opened | 
> | closedDate | FinServ__CloseDate__c | Date the Account was closed | 
> | accountNumber | FinServ__FinancialAccountNumber__c | Number of the Account | 
> | accountStatus | FinServ__Status__c | Current status of the Account | 
> | name | Name | Official name of the Account | 
> | primaryAccountOwner | FinServ__PrimaryOwner__c | Customer who is the primary owner of the account | 
> | createdDate | CreatedDate | Date the Account record was created in the system | 
> | createdBy | CreatedById | System user who created the Account | 
> | updatedDate | LastModifiedDate | Date the Account was last modified by a system user | 
> | updatedBy | LastModifiedById | System user who last modified the Account | 


# accounts-get-transactions
This transformation produces a list of canonical FINS Transactions from a SF Financial Account Transaction list

## Variables

__var__ `s`
> Maps a list of SF Financial Accounts to a FINS Account   


## Mapping Tables

Maps a list of SF Financial Accounts to a FINS Account 

> | FINS | Salesforce Financial Account Transaction | Description | 
> | ---- |---- |---- |
> | id | Id |  ID of the Transaction | 
> | externalIds[].externalId | Global_Account_Id__c | External ID of the Account | 
> | name | Name | Name of the Transaction | 
> | description | FinServ__Description__c | Description of the Transaction | 
> | amount | FinServ__Amount__c | Total amount of the Transaction | 
> | transactionDate | FinServ__TransactionDate__c | Date the Transaction occurred | 
> | transactionType | FinServ__TransactionType__c | Type of the Transaction | 
> | transactionSubType | FinServ__TransactionSubtype__c | Subtype of the Transaction | 
> | transactionStatus | FinServ__TransactionStatus__c | Status of the Transaction | 
> | postedDate | FinServ__PostDate__c | Date the Transaction was processed and settled | 
> | isDisputed | FinServ__IsDisputed__c | Whether the Transaction is disputed | 
> | disputedReason | FinServ__DisputeReason__c | Why the Transaction is disputed | 
> | auditInfo.createdDate | CreatedDate | Datetime when the Transaction record was internally created | 
> | auditInfo.createdBy | CreatedById | User which created the Transaction | 
> | auditInfo.updatedBy | LastModifiedById | User which last modified the Transaction | 
> | auditInfo.updatedDate | LastModifiedDate | Datetime when the Transaction was last modified | 


# ping-response-payload

