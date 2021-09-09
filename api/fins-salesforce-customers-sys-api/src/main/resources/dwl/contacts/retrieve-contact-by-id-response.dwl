/**
 * Salesforce Contact to CIM Individual format mapping
 */

%dw 2.0
output application/json
fun getFormattedDateTime(toFormat) =(toFormat as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSSz"} as String {format: "yyyy-MM-dd'T'HH:mm:ssz"} default null)
var contact= vars.contactReturned
---
/**
 * Maps Salesforce Contact to CIM Individual format
 * @table CIM,Salesforce Contact,Description
 * @row id,id, The identifier of the contact in Salesforce
 * @row salutation,Salutation, The salutation of the contact
 * @row personName,Name, The name of the contact
 * @row firstName,FirstName, The first name of the contact
 * @row lastName,LastName, The Last name of the contact
 * @row birthDate,Birthdate, The birth date of the contact
 * @row partyType,Individual, The contact party set as "Individual"
 * @row contactPointType,ContactPointAddress,contactPointType set as "ContactPointAddress"
 * @row id,null,The contactPointAddress id set as null
 * @row activeFromDate,now(), The date from which the contactpoint is active - Set as current date
 * @row addressLine1,MailingStreet,The mailing address of the contact
 * @row cityName,MailingCity,The mailing city of the contact
 * @row postalCodeText,MailingPostalCode,The contact mailing postal code
 * @row stateProvinceName,MailingState,The contact state province name
 * @row countryName,MailingCountry,The country name of the contact
 * @row geoLatitude,MailingLatitude,The geo-latitude code of the contact
 * @row geoLongitude,MailingLongitude,The geo-longitude code of the contact 
 * @row geoAccuracy,MailingGeocodeAccuracy,The geo-code accurate location of the contact 
 * @row contactPointType,ContactPointEmail, contactPointType set as "ContactPointEmail"
 * @row id,null,The contactpoint id set as null
 * @row activeFromDate,now(), The date from which the contactpoint is active - Set as current date
 * @row emailAddress,Email, The email address of the contact 
 * @row contactPointType,ContactPointPhone,contactPointType - set as "ContactPointPhone"
 * @row contactPointType,ContactId,The contactpoint id - set as null
 * @row activeFromDate,now(), The date from which the contactpoint is active - Set as current date
 * @row telephoneNumber,Phone,The phone number of the contact
 * @row externalIds.id,id, Id field is hardcoded as empty string
 * @row externalIds.externalId,Global_Individual_Id__c, The identifier of the contact in MDM system
 * @row externalIds.externalIdType,MDM,The externalId Type set as "MDM"
 * @row externalIds.statusLastChangedDate,LastModifiedDate, Last modified date to "yyyy-MM-dd'T'HH:mm:ssz"
 * @row externalIds.status,VALID,The externalId status is set as VALID
 * @row auditInfo.createdDate, CreatedDate,Timestamp of when the contact was created 
 * @row auditInfo.createdBy, CreatedBy.Name,Identifies the system or user which created the contact
 * @row auditInfo.updatedDate, LastModifiedDate,Timestamp of when the contact was last updated
 * @row auditInfoupdatedBy, LastModifiedBy.Name,Identifies the system or user which last updated the contact
 * @row auditInfo.isDeleted, IsDeleted,Indicates whether or not the contact has been soft-deleted 
 */
{
	id: contact.Id,
	salutation: contact.Salutation default "",
	personName: contact.Name default "",
	firstName: contact.FirstName default "",
	lastName: contact.LastName default "",
	birthDate: contact.Birthdate default null,
	partyType: "Individual",
	contactPoints: vars.contactPoints,
	(externalIds: [{
		id: "",
		externalId: contact.Global_Individual_Id__c,
		externalIdType: ["MDM"],
		statusLastChangedDate: getFormattedDateTime(contact.LastModifiedDate),
		status: "VALID"
	}])  if(!isEmpty(contact.Global_Individual_Id__c)),
	auditInfo: {
		createdDate: getFormattedDateTime(contact.CreatedDate),
		createdBy: contact.CreatedBy.Name as String default "",
		updatedDate: getFormattedDateTime(contact.LastModifiedDate),
		updatedBy: contact.LastModifiedBy.Name as String default "",
		isDeleted: contact.IsDeleted as Boolean default null
	}
}
