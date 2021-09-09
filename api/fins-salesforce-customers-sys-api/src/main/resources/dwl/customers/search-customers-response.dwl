/**
 * Salesforce Account to CIM Customer format mapping response
 */

%dw 2.0
output application/json
fun getFormattedDateTime(toFormat) =(toFormat as DateTime {
	format: "yyyy-MM-dd'T'HH:mm:ss.SSSz"
} as String {
	format: "yyyy-MM-dd'T'HH:mm:ssz"
} default null)
fun isOrgAccount(isPersonAccount)= (!(isPersonAccount))

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
vars.customersReturned map {
	partyRoleType: "Customer",
	id: $.Id,
	party: [{
		(salutation: $.Salutation default "") if(!isOrgAccount($.IsPersonAccount)),
		(personName: ($.FirstName default "") ++ " " ++ ($.LastName default "")) if(!isOrgAccount($.IsPersonAccount)),
		(firstName: $.FirstName default "") if(!isOrgAccount($.IsPersonAccount)),
		(lastName: $.LastName default "") if(!isOrgAccount($.IsPersonAccount)),
		(birthDate: $.PersonBirthdate default null) if(!isOrgAccount($.IsPersonAccount)),
		(name: $.Name) if(isOrgAccount($.IsPersonAccount)),
		partyType: if(isOrgAccount($.IsPersonAccount)) "Organization" else "Individual",
		id: if(isOrgAccount($.IsPersonAccount)) $.Id else null,
		contactPoints: [({
			"contactPointType": ["ContactPointAddress"],
			id: null,
			activeFromDate: now() as Date {
				format: "yyyy-MM-dd"
			},
			addressLine1: if(isOrgAccount($.IsPersonAccount)) $.BillingStreet else $.PersonMailingStreet ,
			cityName: if(isOrgAccount($.IsPersonAccount)) $.BillingCity else $.PersonMailingCity default "",
			postalCodeText: if(isOrgAccount($.IsPersonAccount)) $.BillingPostalCode else $.PersonMailingPostalCode  default "",
			stateProvinceName: if(isOrgAccount($.IsPersonAccount)) $.BillingState else $.PersonMailingState default "",
			countryName: if(isOrgAccount($.IsPersonAccount)) $.BillingCountry else $.PersonMailingCountry  default "",
			geoLatitude: if(isOrgAccount($.IsPersonAccount)) $.BillingLatitude else $.PersonMailingLatitude default null,
			geoLongitude: if(isOrgAccount($.IsPersonAccount)) $.BillingLongitude else $.PersonMailingLongitude default null,
			geoAccuracy: if(isOrgAccount($.IsPersonAccount)) $.BillingGeocodeAccuracy else $.PersonMailingGeocodeAccuracy default null
		}) if(!isEmpty($.PersonMailingStreet) or !isEmpty($.BillingStreet)),
({
			"contactPointType": ["ContactPointEmail"],
			id: null,
			activeFromDate: now() as Date {
				format: "yyyy-MM-dd"
			},
			emailAddress: $.PersonEmail
		}) if(!isEmpty($.PersonEmail)),
({
			"contactPointType": ["ContactPointPhone"],
			id: null,
			activeFromDate: now() as Date {
				format: "yyyy-MM-dd"
			},
			telephoneNumber: $.Phone
		}) if(!isEmpty($.Phone))]
	}],
	(externalIds: [{
		id: "",
		externalId: $.Global_Customer_Id__c,
		externalIdType: ["MDM"],
		statusLastChangedDate: getFormattedDateTime($.LastModifiedDate),
		status: "VALID"
	}]) if(!isEmpty($.Global_Customer_Id__c)),
	auditInfo: {
		createdDate: getFormattedDateTime($.CreatedDate),
		createdBy: $.CreatedBy.Name as String default "",
		updatedDate: getFormattedDateTime($.LastModifiedDate),
		updatedBy: $.LastModifiedBy.Name as String default "",
		isDeleted: $.IsDeleted as Boolean default null
	},
	customerNumber: $.AccountNumber default "",
	customerStatus: "ACTIVE"
} default []
