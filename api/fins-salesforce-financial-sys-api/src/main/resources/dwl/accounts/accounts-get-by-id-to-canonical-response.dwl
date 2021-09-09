/**
 * This transformation produces a single canonical FINS Account from a SF Financial Account
 */

%dw 2.0
import dwl::accounts::AccountsTools
output application/json skipNullOn="everywhere"
---
/**
 * Maps a single SF Financial Accounts to a FINS Account 
 * @table FINS,Salesforce Financial Account,Description
 * @row id,id,SF internal ID of the Account
 * @row externalIds[].externalId,Global_Account_Id__c,External ID of the Account
 * @row accountCurrency,CurrencyIsoCode,ISO Currency code used by the Account
 * @row identificationNumber,FinServ__TaxID__c,Tax Identification Number of the Account
 * @row accountBalance,FinServ__Balance__c, Balance of the Account
 * @row accountType,FinServ__FinancialAccountType__c,(enum) Type of Account
 * @row accountLabel,FinServ__Nickname__c,Personalized name of the Account
 * @row availableBalance,FinServ__CashBalance__c,Available balance of the Account 
 * @row openedDate,FinServ__OpenDate__c,Date the Account was opened
 * @row closedDate,FinServ__CloseDate__c,Date the Account was closed
 * @row accountNumber,FinServ__FinancialAccountNumber__c,Number of the Account
 * @row accountStatus,FinServ__Status__c,Current status of the Account
 * @row name,Name,Official name of the Account
 * @row primaryAccountOwner,FinServ__PrimaryOwner__c,Customer who is the primary owner of the account
 * @row createdDate,CreatedDate,Date the Account record was created in the system
 * @row createdBy,CreatedById,System user who created the Account
 * @row updatedDate,LastModifiedDate,Date the Account was last modified by a system user
 * @row updatedBy,LastModifiedById,System user who last modified the Account
 */
{
	id: payload[0]."Id",
	(externalIds: [
		{
			id: null,
			externalId: payload[0].Global_Account_Id__c,
			externalIdType: [ "FIS" ],
			status: "VALID",
			statusLastChangedDate: payload[0].CreatedDate
		}
	]) if(!isEmpty(payload[0].Global_Account_Id__c)),
	accountCurrency: payload[0]."CurrencyIsoCode",
	identificationNumber: payload[0]."FinServ__TaxID__c",
	(accountBalance: payload[0]."FinServ__Balance__c" as Number) if(!isEmpty(payload[0]."FinServ__Balance__c")),
	accountType: AccountsTools::sfAccountTypeToFins(payload[0]."FinServ__FinancialAccountType__c"),
	accountLabel: payload[0]."FinServ__Nickname__c",
	(availableBalance: payload[0]."FinServ__CashBalance__c" as Number) if(!isEmpty(payload[0]."FinServ__CashBalance__c")),
	openedDate: payload[0]."FinServ__OpenDate__c",
	closedDate: payload[0]."FinServ__CloseDate__c",
	accountNumber: payload[0]."FinServ__FinancialAccountNumber__c",
	accountStatus: AccountsTools::sfAccountStatusToFins(payload[0]."FinServ__Status__c"),
	name: payload[0]."Name",
	primaryAccountOwner: payload[0].FinServ__PrimaryOwner__c,
	auditInfo: {
		createdDate: AccountsTools::getFormattedDateTime(payload[0].CreatedDate),
		createdBy: payload[0].CreatedBy.Name as String default "",
		updatedDate: AccountsTools::getFormattedDateTime(payload[0].LastModifiedDate),
		updatedBy: payload[0].LastModifiedBy.Name as String default "",
		isDeleted: payload[0].IsDeleted as Boolean default false
	}
}