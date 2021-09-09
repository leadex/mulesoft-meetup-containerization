/**
 * Salesforce Person Account create  mapping
 */

%dw 2.0
output application/java
var customerToCreate= (payload.party filter((lower($.partyType)) == p('customer.party-type-individual')))[0]
var mdmGlobalCustomerId=((flatten(payload.externalIds)) filter ($.externalIdType contains "MDM") map $.externalId)[0]
var contactPoints=(payload.party filter((lower($.partyType)) == p('customer.party-type-individual')))[0].contactPoints
var emailAddress=(contactPoints filter ($.contactPointType contains("ContactPointEmail")))[0].emailAddress
var phone=(contactPoints filter ($.contactPointType contains("ContactPointPhone")))[0].telephoneNumber
var addressInfo=(contactPoints filter ($.contactPointType contains("ContactPointAddress")))[0]
---
/**
 * Maps CIM Customer format to Salesforce Person Account Object
 * @table Salesforce Person Account,CIM,Description
 * @row Salutation,party.salutation,The salutation of the customer
 * @row FirstName,party.firstName,The First Name of the customer
 * @row lastName,party.LastName,The Last Name of the customer
 * @row PersonBirthDate,party.birthDate,The birth date of the customer
 * @row Global_Customer_Id__c,externalIds.externalId,The Global-Id of the customer when externalIdType matches MDM
 * @row RecordTypeId,recordTypeId,The Salesforce record Id for creating a customer
 * @row AccountNumber,customerNumber,The customer Account Number
 * @row PersonMailingStreet,party.contactPointAddress.addressLine1,The mailing Address of the customer
 * @row PersonMailingCity,party.contactPointAddress.cityName,The mailing city of the customer
 * @row PersonMailingPostalCode,party.contactPointAddress.postalCodeText,The mailing postal code of the customer
 * @row PersonMailingState,party.contactPointAddress.stateProvinceName,The customer mailing state
 * @row PersonMailingCountry,party.contactPointAddress.countryName,The customer mailing country
 * @row PersonMailingLatitude,party.contactPointAddress.geoLatitude,The customer geo lattitude location
 * @row PersonMailingLongitude,party.contactPointAddress.geoLongitude,The customer geo logitude location
 * @row PersonEmail,party.ContactPointEmail.emailAddress,The customer contact email
 * @row Phone,party.ContactPointPhone.telephoneNumber,The customer contact phone Number
 */
[{
	Salutation: customerToCreate.salutation,
	FirstName: customerToCreate.firstName,
	LastName: customerToCreate.lastName,
	PersonBirthDate: customerToCreate.birthDate as Date {format: "yyyy-MM-dd"} default "",
	Global_Customer_Id__c: mdmGlobalCustomerId,
	RecordTypeId: vars.recordTypeId,
	AccountNumber: payload.customerNumber,
	(PersonMailingStreet: addressInfo.addressLine1) if(!isEmpty(addressInfo.addressLine1)),
	(PersonMailingCity: addressInfo.cityName) if(!isEmpty(addressInfo.cityName)),
	(PersonMailingPostalCode:addressInfo.postalCodeText) if(!isEmpty(addressInfo.postalCodeText)),
	(PersonMailingState: addressInfo.stateProvinceName) if(!isEmpty(addressInfo.stateProvinceName)),
	(PersonMailingCountry: addressInfo.countryName) if(!isEmpty(addressInfo.countryName)),
	(PersonMailingLatitude: addressInfo.geoLatitude) if(!isEmpty(addressInfo.geoLatitude)),
	(PersonMailingLongitude: addressInfo.geoLongitude) if(!isEmpty(addressInfo.geoLongitude)),
	(PersonEmail: emailAddress) if(!isEmpty(emailAddress)),
	(Phone: phone) if(!isEmpty(phone))
}]
