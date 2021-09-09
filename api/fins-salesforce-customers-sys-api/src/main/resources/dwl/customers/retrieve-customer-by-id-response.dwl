/**
 * Salesforce Person Account to CIM Customer format mapping
 */

%dw 2.0
output application/json
fun getFormattedDateTime(toFormat) =(toFormat as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSSz"} as String {format: "yyyy-MM-dd'T'HH:mm:ssz"} default null)
var cust= vars.customer
var isOrgAccount= (!(cust.IsPersonAccount))
---
/**
 * Maps Salesforce Account to CIM Customer format
 * The CIM Customer (PartyRole) can have either Individual or Organization as Party. 
 * The Salesforce PersonAccount is mapped as a Customer with Party as Individual in CIM.
 * The Salesforce Account is mapped as a Customer with Party as Organization in CIM.
 * @table CIM,Salesforce Person Account,Description
 * @row partyRoleType,Customer, Hardcoded partyrole to customer
 * @row id,customerId, The customer Id
 * @row party.id,id, The party Id is hardcoded to null
 * @row party.salutation,Salutation, The customer salutation
 * @row party.personName,FirstName ++ LastName, The customer personal name (concatenate FistName + LastName)
 * @row party.firstName,FirstName, The customer first name
 * @row party.lastName,LastName, The customer Last name
 * @row party.birthDate,PersonBirthdate, The customer birth date
 * @row party.partyType,Individual, The customer party type hardcoded as Individual or Organization
 * @row contactPointType,ContactPointAddress, Hardcoded customer contact type to ContactPointAddress
 * @row id,PersonContactId,The customer Id
 * @row activeFromDate,todays date, The customer Active from date is hardcoded to Todays date
 * @row addressLine1,PersonMailingStreet,The customers mailing address
 * @row cityName,PersonMailingCity,The customers mailing city
 * @row postalCodeText,PersonMailingPostalCode,The customer mailing postal code
 * @row stateProvinceName,PersonMailingState,The customer state province name
 * @row countryName,PersonMailingCountry,The customer country name
 * @row geoLatitude,PersonMailingLatitude,The customer geo-latitude code
 * @row geoLongitude,PersonMailingLongitude,The customer geo-longitude code
 * @row geoAccuracy,PersonMailingGeocodeAccuracy,The customer geo-code accurate location
 * @row contactPointType,ContactPointEmail, Hardcoded customer contact type to ContactPointEmail
 * @row id,PersonContactId,The customer id
 * @row activeFromDate,todays date,The customer Active from date is hardcoded to todays date
 * @row emailAddress,PersonEmail, The customer contact email address
 * @row contactPointType,ContactPointPhone,Hardcoded customer contact type to ContactPointPhone
 * @row contactPointType,PersonContactId,The customer id
 * @row activeFromDate,todays date, The customer Active from date is hardcoded to todays date
 * @row telephoneNumber,Phone,The customer phone number
 * @row externalIds.id,id, Id field is hardcoded as empty string
 * @row externalIds.externalId,Global_Customer_Id__c, The customer Global Id
 * @row externalIds.externalIdType,MDM,The customer is hardcoded as MDM
 * @row externalIds.statusLastChangedDate,LastModifiedDate, Last modified date to "yyyy-MM-dd'T'HH:mm:ssz"
 * @row externalIds.status,VALID,The customer status is hardcoded as VALID
 * @row auditInfo.createdDate,CreatedDate,The customer created date to "yyyy-MM-dd'T'HH:mm:ssz"
 * @row auditInfo.createdBy,CreatedBy.Name,The last created by user name
 * @row auditInfo.updatedDate,LastModifiedDate, The last updated date to "yyyy-MM-dd'T'HH:mm:ssz"
 * @row auditInfo.updatedBy,LastModifiedBy.Name, The last modified user name
 * @row auditInfo.isDeleted,IsDeleted, returns true if user deleted else false
 * @row customerNumber,AccountNumber, The customer Account Number
 * @row customerStatus,ACTIVE, Hardcoded as ACTIVE
 */
{
	partyRoleType: "Customer",
	id: cust.Id,
	party: [{
		id: if(isOrgAccount) cust.Id else null,
		(salutation: cust.Salutation default "") if(!isOrgAccount) ,
		(personName: (cust.FirstName default "") ++ " " ++ (cust.LastName default "")) if(!isOrgAccount),
		(firstName: cust.FirstName default "") if(!isOrgAccount),
		(lastName: cust.LastName default "") if(!isOrgAccount),
		(birthDate: cust.PersonBirthdate default null) if(!isOrgAccount),
		(name: cust.Name) if(isOrgAccount),
		partyType: if(isOrgAccount) "Organization" else "Individual",
		contactPoints: vars.contactPoints
	}],
	(externalIds: [{
		id: "",
		externalId: cust.Global_Customer_Id__c,
		externalIdType: ["MDM"],
		statusLastChangedDate:getFormattedDateTime(cust.LastModifiedDate),
		status: "VALID"
	}])  if(!isEmpty(cust.Global_Customer_Id__c)),
	auditInfo: {
		createdDate: getFormattedDateTime(cust.CreatedDate),
		createdBy: cust.CreatedBy.Name as String default "",
		updatedDate: getFormattedDateTime(cust.LastModifiedDate),
		updatedBy: cust.LastModifiedBy.Name as String default "",
		isDeleted: cust.IsDeleted as Boolean default null
	},
	customerNumber: cust.AccountNumber default "",
	customerStatus: "ACTIVE"
}
