/**
 * Salesforce  Contact create  mapping
 */

%dw 2.0
output application/java
var mdmGlobalContactId=((flatten(payload.externalIds)) filter ($.externalIdType contains "MDM") map $.externalId)[0]
var contactPoints= payload.contactPoints
var emailAddress=(contactPoints filter ($.contactPointType contains("ContactPointEmail")))[0].emailAddress
var phone=(contactPoints filter ($.contactPointType contains("ContactPointPhone")))[0].telephoneNumber
var addressInfo=(contactPoints filter ($.contactPointType contains("ContactPointAddress")))[0]
---
/**
 * Maps CIM Individual format to Salesforce  Contact Object
 * @table Salesforce  Contact,CIM,Description
 * @row Salutation,party.salutation,The salutation of the contact
 * @row FirstName,party.firstName,The First Name of the contact
 * @row lastName,party.LastName,The Last Name of the contact
 * @row BirthDate,party.birthDate,The birth date of the contact
 * @row Global_Individual_Id__c,externalIds.externalId,The identifier of the contact in MDM system
 * @row MailingStreet,party.contactPointAddress.addressLine1,The mailing Address of the contact
 * @row MailingCity,party.contactPointAddress.cityName,The mailing city of the contact
 * @row MailingPostalCode,party.contactPointAddress.postalCodeText,The mailing postal code of the contact
 * @row MailingState,party.contactPointAddress.stateProvinceName,The contact mailing state
 * @row MailingCountry,party.contactPointAddress.countryName,The contact mailing country
 * @row MailingLatitude,party.contactPointAddress.geoLatitude,The contact geo lattitude location
 * @row MailingLongitude,party.contactPointAddress.geoLongitude,The contact geo logitude location
 * @row Email,party.ContactPointEmail.emailAddress,The contact email
 * @row Phone,party.ContactPointPhone.telephoneNumber,The contact phone Number
 */
[{
	Salutation: payload.salutation,
	FirstName: payload.firstName,
	LastName:  if(!isEmpty(payload.lastName)) payload.lastName else payload.personName,
	BirthDate: payload.birthDate as Date {format: "yyyy-MM-dd"} default "",
	(Global_Individual_Id__c : mdmGlobalContactId) if(!isEmpty(mdmGlobalContactId)) ,
	(MailingStreet: addressInfo.addressLine1) if(!isEmpty(addressInfo.addressLine1)),
	(MailingCity: addressInfo.cityName) if(!isEmpty(addressInfo.cityName)),
	(MailingPostalCode:addressInfo.postalCodeText) if(!isEmpty(addressInfo.postalCodeText)),
	(MailingState: addressInfo.stateProvinceName) if(!isEmpty(addressInfo.stateProvinceName)),
	(MailingCountry: addressInfo.countryName) if(!isEmpty(addressInfo.countryName)),
	(MailingLatitude: addressInfo.geoLatitude) if(!isEmpty(addressInfo.geoLatitude)),
	(MailingLongitude: addressInfo.geoLongitude) if(!isEmpty(addressInfo.geoLongitude)),
	(Email: emailAddress) if(!isEmpty(emailAddress)),
	(Phone: phone) if(!isEmpty(phone))
}]
