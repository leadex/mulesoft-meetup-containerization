/**
 * This module produces a SF FinancialAccount creation.
 */
 
%dw 2.0
import dwl::accounts::AccountsTools
output application/java
---
/**
 * Maps a single FINS Account to a list with a single SF Financial Account
 * @table Salesforce Financial Account,FINS,Description
 * @row externalIds[0].externalId,Global_Account_Id,FINS external id of the Account
 * @row FinServ__PrimaryOwner__c,customerId,SF internal ID of the Person Account who owns this Financial Account
 * @row CurrencyIsoCode,accountCurrency,ISO Currency code used by the Account
 * @row FinServ__TaxID__c,identificationNumber,Tax Identification Number of the Account
 * @row FinServ__Balance__c,accountBalance, Balance of the Account
 * @row FinServ__FinancialAccountType__c,accountType,Type of Account
 * @row FinServ__Nickname__c,accountLabel,Personalized name of the Account
 * @row FinServ__CashBalance__c,availableBalance,Available balance of the Account 
 * @row FinServ__OpenDate__c,openedDate,Date the Account was opened
 * @row FinServ__CloseDate__c,closedDate,Date the Account was closed
 * @row FinServ__FinancialAccountNumber__c,accountNumber,Number of the Account
 * @row FinServ__Status__c,accountStatus,Current status of the Account
 * @row Name,name,Official name of the Account
 */
[
	{
		(Global_Account_Id__c: payload.externalIds[0].externalId) if(!isEmpty(payload.externalIds)),
		FinServ__PrimaryOwner__c: payload.primaryAccountOwner,
		CurrencyIsoCode: payload.accountCurrency,
		FinServ__TaxID__c: payload.identificationNumber,
		FinServ__Balance__c: payload.accountBalance,
		FinServ__FinancialAccountType__c: AccountsTools::finsAccountTypeToSf(payload.accountType),
		FinServ__Nickname__c: payload.accountLabel,
		FinServ__CashBalance__c: payload.availableBalance,
		(FinServ__OpenDate__c: payload.openedDate as Date) if(!isEmpty(payload.openedDate)),
		(FinServ__CloseDate__c: payload.closedDate as Date) if(!isEmpty(payload.closedDate)),
		FinServ__FinancialAccountNumber__c: payload.accountNumber,
		FinServ__Status__c: AccountsTools::finsAccountStatusToSf(payload.accountStatus),
		Name: payload.name
	}
]