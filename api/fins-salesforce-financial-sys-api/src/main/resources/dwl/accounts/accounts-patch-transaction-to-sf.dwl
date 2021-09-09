/**
 * This module produces a SF FinancialAccount update.
 */

%dw 2.0
import dwl::accounts::AccountsTools
output application/java
---
/**
 * Maps a single FINS Transaction to a SF Financial Account Transaction
 * @table Salesforce Financial Account,FINS,Description
 * @row id,id,SF internal ID of the Transaction
 * @row FinServ__IsDisputed__c,isDisputed,Whether the Transaction is disputed
 * @row FinServ__DisputeReason__c,disputedReason,Why the Transaction is disputed
 */
[
	{
		Id: attributes.uriParams.transactionId,
		(FinServ__IsDisputed__c: payload.isDisputed) if(!isEmpty(payload.isDisputed)),
		(FinServ__DisputeReason__c: AccountsTools::finsTransactionDisputedReasonToSf(payload.disputedReason)) if(!isEmpty(payload.disputedReason))
	}
]