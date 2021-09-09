/**
 * Salesforce Organization Account update  mapping
 */

%dw 2.0
output application/java
var customerToUpdate= (payload.party filter((lower($.partyType)) ==   p('customer.party-type-organization')))[0]
var mdmGlobalCustomerId=((flatten(payload.externalIds)) filter ($.externalIdType contains "MDM") map $.externalId)[0]
var contactPoints=(payload.party filter((lower($.partyType)) ==   p('customer.party-type-organization')))[0].contactPoints
var emailAddress=(contactPoints filter ($.contactPointType contains("ContactPointEmail")))[0].emailAddress
var phone=(contactPoints filter ($.contactPointType contains("ContactPointPhone")))[0].telephoneNumber
var addressInfo=(contactPoints filter ($.contactPointType contains("ContactPointAddress")))[0]
---
/**
 * Maps CIM format to Salesforce Account Object
 * @table Salesforce Person Account,CIM,Description
 * @row Id,customerId,The customer Id from the Uriparams
 * @row Salutation,party.salutation,The salutation of the customer
 * @row FirstName,party.firstName,The First Name of the customer
 * @row lastName,party.LastName,The Last Name of the customer
 * @row PersonBirthDate,party.birthDate,The birth date of the customer
 * @row AccountNumber,customerNumber,The customer Account Number
 * @row Global_Customer_Id__c,externalIds.externalId,The Global-Id of the customer when externalIdType matches MDM
 */
[{
	Id: vars.customerId,
	(Name: customerToUpdate.name) if(!isEmpty(customerToUpdate.name)),
	(AccountNumber: payload.customerNumber) if(!isEmpty(payload.customerNumber)),
	(Global_Customer_Id__c: mdmGlobalCustomerId) if(!isEmpty(mdmGlobalCustomerId)),
	(BillingStreet: addressInfo.addressLine1) if(!isEmpty(addressInfo.addressLine1)),
	(BillingCity: addressInfo.cityName) if(!isEmpty(addressInfo.cityName)),
	(BillingPostalCode:addressInfo.postalCodeText) if(!isEmpty(addressInfo.postalCodeText)),
	(BillingState: addressInfo.stateProvinceName) if(!isEmpty(addressInfo.stateProvinceName)),
	(BillingCountry: addressInfo.countryName) if(!isEmpty(addressInfo.countryName)),
	(BillingLatitude: addressInfo.geoLatitude) if(!isEmpty(addressInfo.geoLatitude)),
	(BillingLongitude: addressInfo.geoLongitude) if(!isEmpty(addressInfo.geoLongitude)),
	(Phone: phone) if(!isEmpty(phone))
}]
