/**
 * Salesforce Organization Account create  mapping
 */

%dw 2.0
output application/java
var customerToCreate= (payload.party filter((lower($.partyType)) ==   p('customer.party-type-organization')))[0]
var mdmGlobalCustomerId=((flatten(payload.externalIds)) filter ($.externalIdType contains "MDM") map $.externalId)[0]
var contactPoints=(payload.party filter((lower($.partyType)) ==   p('customer.party-type-organization')))[0].contactPoints
var emailAddress=(contactPoints filter ($.contactPointType contains("ContactPointEmail")))[0].emailAddress
var phone=(contactPoints filter ($.contactPointType contains("ContactPointPhone")))[0].telephoneNumber
var addressInfo=(contactPoints filter ($.contactPointType contains("ContactPointAddress")))[0]
---
/**
 * Maps CIM Customer format to Salesforce Person Account Object
 * @table Salesforce Person Account,CIM,Description
 * @row Name,party.name,The Name of the Organization
 * @row FirstName,party.firstName,The First Name of the customer
 * @row lastName,party.LastName,The Last Name of the customer
 * @row PersonBirthDate,party.birthDate,The birth date of the customer
 * @row Global_Customer_Id__c,externalIds.externalId,The Global-Id of the customer when externalIdType matches MDM
 * @row RecordTypeId,recordTypeId,The Salesforce record Id for creating a customer
 * @row AccountNumber,customerNumber,The customer Account Number
 * @row BillingStreet,party.contactPointAddress.addressLine1,The mailing Address of the customer
 * @row BillingCity,party.contactPointAddress.cityName,The mailing city of the customer
 * @row BillingPostalCode,party.contactPointAddress.postalCodeText,The mailing postal code of the customer
 * @row BillingState,party.contactPointAddress.stateProvinceName,The customer mailing state
 * @row BillingCountry,party.contactPointAddress.countryName,The customer mailing country
 * @row BillingLatitude,party.contactPointAddress.geoLatitude,The customer geo lattitude location
 * @row BillingLongitude,party.contactPointAddress.geoLongitude,The customer geo logitude location
 * @row PersonEmail,party.ContactPointEmail.emailAddress,The customer contact email
 * @row Phone,party.ContactPointPhone.telephoneNumber,The customer contact phone Number
 */
[{
	Name: customerToCreate.name,
	Global_Customer_Id__c: mdmGlobalCustomerId,
	RecordTypeId: vars.recordTypeId,
	AccountNumber: payload.customerNumber,
	(BillingStreet: addressInfo.addressLine1) if(!isEmpty(addressInfo.addressLine1)),
	(BillingCity: addressInfo.cityName) if(!isEmpty(addressInfo.cityName)),
	(BillingPostalCode:addressInfo.postalCodeText) if(!isEmpty(addressInfo.postalCodeText)),
	(BillingState: addressInfo.stateProvinceName) if(!isEmpty(addressInfo.stateProvinceName)),
	(BillingCountry: addressInfo.countryName) if(!isEmpty(addressInfo.countryName)),
	(BillingLatitude: addressInfo.geoLatitude) if(!isEmpty(addressInfo.geoLatitude)),
	(BillingLongitude: addressInfo.geoLongitude) if(!isEmpty(addressInfo.geoLongitude)),
	(Phone: phone) if(!isEmpty(phone))
}]
