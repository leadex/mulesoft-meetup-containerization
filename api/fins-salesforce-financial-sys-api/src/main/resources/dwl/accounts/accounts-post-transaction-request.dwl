%dw 2.0
output application/java
import dwl::accounts::AccountsTools
---

[{
    Global_Transaction_Id__c: payload.externalIds[?($.externalIdType[0] == "FIS")].externalId default "",
	//Name: payload.name,
	FinServ__Description__c: payload.description,
	FinServ__Amount__c: payload.amount as Number,
	FinServ__TransactionDate__c: if (!isEmpty(payload.transactionDate)) payload.transactionDate as DateTime else now(),
	FinServ__TransactionType__c: AccountsTools::cimTransactionTypeToSF(payload.transactionType),
//TODO: TransactionSubtype mappings depend on value of TransactionType
	//FinServ__TransactionSubtype__c: AccountsTools::cimTransactionSubtypeToSF(payload.transactionSubType),
	FinServ__TransactionStatus__c: AccountsTools::cimTransactionStatusToSF(payload.transactionStatus),
    FinServ__PostDate__c: if (!isEmpty(payload.postedDate)) (payload.postedDate ++ "T00:00:00Z") as DateTime else null,
	FinServ__IsDisputed__c: if(!isEmpty(payload.isDisputed)) payload.isDisputed as Boolean else false,
	(FinServ__DisputeReason__c: AccountsTools::finsTransactionDisputedReasonToSf(payload.disputedReason)) if (!isEmpty(payload.disputedReason)),
	FinServ__FinancialAccount__c: vars.accountId
}]