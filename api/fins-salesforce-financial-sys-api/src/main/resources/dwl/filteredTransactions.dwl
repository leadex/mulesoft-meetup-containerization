%dw 2.0
output application/json
import dwl::accounts::AccountsTools
---
if (!isEmpty(vars.queryParams.transactionType)) payload filter $.FinServ__TransactionType__c == AccountsTools::cimTransactionTypeToSF(vars.queryParams.transactionType)
else if (!isEmpty(vars.queryParams.transactionSubType)) payload filter $.FinServ__TransactionSubtype__c == AccountsTools::cimTransactionSubtypeToSF(vars.queryParams.transactionSubType)
else if (!isEmpty(vars.queryParams.postedDate)) payload filter $.FinServ__PostDate__c == (vars.queryParams.postedDate ++ "T00:00:00.000Z")
else if (!isEmpty(vars.queryParams.fromDate)) payload filter $.LastModifiedDate >= vars.queryParams.fromDate
else if (!isEmpty(vars.queryParams.toDate)) payload filter $.LastModifiedDate <= vars.queryParams.toDate
else ""