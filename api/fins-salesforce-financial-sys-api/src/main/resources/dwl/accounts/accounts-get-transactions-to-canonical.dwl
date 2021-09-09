/**
 * This transformation produces a list of canonical FINS Transactions from a SF Financial Account Transaction list
 */

%dw 2.0
import dwl::accounts::AccountsTools
output application/json skipNullOn="everywhere"
---
/**
 * Maps a list of SF Financial Accounts to a FINS Account 
 * @table FINS,Salesforce Financial Account Transaction,Description
 * @row id,Id, ID of the Transaction
 * @row externalIds[].externalId,Global_Account_Id__c,External ID of the Account
 * @row name,Name,Name of the Transaction
 * @row description,FinServ__Description__c,Description of the Transaction
 * @row amount,FinServ__Amount__c,Total amount of the Transaction
 * @row transactionDate,FinServ__TransactionDate__c,Date the Transaction occurred
 * @row transactionType,FinServ__TransactionType__c,Type of the Transaction
 * @row transactionSubType,FinServ__TransactionSubtype__c,Subtype of the Transaction
 * @row transactionStatus,FinServ__TransactionStatus__c,Status of the Transaction
 * @row postedDate,FinServ__PostDate__c,Date the Transaction was processed and settled
 * @row isDisputed,FinServ__IsDisputed__c,Whether the Transaction is disputed
 * @row disputedReason,FinServ__DisputeReason__c,Why the Transaction is disputed
 * @row auditInfo.createdDate,CreatedDate,Datetime when the Transaction record was internally created
 * @row auditInfo.createdBy,CreatedById,User which created the Transaction
 * @row auditInfo.updatedBy,LastModifiedById,User which last modified the Transaction
 * @row auditInfo.updatedDate,LastModifiedDate,Datetime when the Transaction was last modified
 */
payload map {
	id: $.Id,
	(externalIds: [
		{
			id: null,
			externalId: $.Global_Transaction_Id__c,
			externalIdType: [ "FIS" ],
			status: "VALID",
			statusLastChangedDate: $.CreatedDate
		}
	]) if(!isEmpty($.Global_Transaction_Id__c)),
	name: $.Name,
	description: $.FinServ__Description__c,
	amount: $.FinServ__Amount__c as Number,
	transactionDate: $.FinServ__TransactionDate__c,
	transactionType: AccountsTools::sfTransactionTypeToFins($.FinServ__TransactionType__c),
	transactionSubType: AccountsTools::sfTransactionSubtypeToFins($.FinServ__TransactionSubtype__c),
	transactionStatus: AccountsTools::sfTransactionStatusToFins($.FinServ__TransactionStatus__c),
	(postedDate: $.FinServ__PostDate__c) if (!isEmpty($.FinServ__PostDate__c)),
	(isDisputed: $.FinServ__IsDisputed__c as Boolean) if (!isEmpty($.FinServ__IsDisputed__c)),
	(disputedReason: AccountsTools::sfTransactionDisputedReasonToFins($.FinServ__DisputeReason__c)) if (!isEmpty($.FinServ__DisputeReason__c)),
	auditInfo: {
		createdDate: AccountsTools::getFormattedDateTime($.CreatedDate),
		createdBy: $.CreatedBy.Name as String default "",
		updatedDate: AccountsTools::getFormattedDateTime($.LastModifiedDate),
		updatedBy: $.LastModifiedBy.Name as String default "",
		isDeleted: $.IsDeleted as Boolean default false
	}
}