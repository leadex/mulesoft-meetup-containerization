/**
 * Salesforce Person Account update  mapping
 */

%dw 2.0
output application/java
var customerToUpdate= (payload.party filter((lower($.partyType)) == "individual"))[0]
var mdmGlobalCustomerId=((flatten(payload.externalIds)) filter ($.externalIdType contains "MDM") map $.externalId)[0]
var contactPoints=(payload.party filter((lower($.partyType)) == "individual"))[0].contactPoints
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
	(Salutation: customerToUpdate.salutation) if(!isEmpty(customerToUpdate.salutation)),
	(FirstName: customerToUpdate.firstName) if(!isEmpty(customerToUpdate.firstName)),
	(LastName: customerToUpdate.lastName) if(!isEmpty(customerToUpdate.lastName)),
	(PersonBirthDate: customerToUpdate.birthDate as Date {format: "yyyy-MM-dd"}) if(!isEmpty(customerToUpdate.birthDate)),
	(AccountNumber: payload.customerNumber) if(!isEmpty(payload.customerNumber)),
	(Global_Customer_Id__c: mdmGlobalCustomerId) if(!isEmpty(mdmGlobalCustomerId)),
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
