%dw 2.0
output application/json
fun getFormattedDateTime(toFormat) =(toFormat as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSSz"} as String {format: "yyyy-MM-dd'T'HH:mm:ssz"} default null)
var contactInfo=vars.customer
var isOrgAccount= (!(contactInfo.IsPersonAccount))
---

[({
	"contactPointType": ["ContactPointAddress"],
	id: null,
	activeFromDate: now() as Date {format: "yyyy-MM-dd"},
	addressLine1: if(isOrgAccount) contactInfo.BillingStreet else contactInfo.PersonMailingStreet,
	cityName: if(isOrgAccount) contactInfo.BillingCity else contactInfo.PersonMailingCity default "",
	postalCodeText: if(isOrgAccount) contactInfo.BillingPostalCode else contactInfo.PersonMailingPostalCode default "",
	stateProvinceName: if(isOrgAccount) contactInfo.BillingState else contactInfo.PersonMailingState default "",
	countryName: if(isOrgAccount) contactInfo.BillingCountry else contactInfo.PersonMailingCountry default "",
	geoLatitude: if(isOrgAccount) contactInfo.BillingLatitude else contactInfo.PersonMailingLatitude default null,
	geoLongitude: if(isOrgAccount) contactInfo.BillingLongitude else contactInfo.PersonMailingLongitude default null,
	geoAccuracy: if(isOrgAccount) contactInfo.BillingGeocodeAccuracy else contactInfo.PersonMailingGeocodeAccuracy default null
}) if((!isEmpty(contactInfo.PersonMailingStreet)) or (!isEmpty(contactInfo.BillingStreet))),
({
	"contactPointType": ["ContactPointEmail"],
	id: null,
	activeFromDate: now() as Date {
		format: "yyyy-MM-dd"
	},
	emailAddress: contactInfo.PersonEmail
}) if(!isEmpty(contactInfo.PersonEmail)),
({
	"contactPointType": ["ContactPointPhone"],
	id: null,
	activeFromDate: now() as Date {
		format: "yyyy-MM-dd"
	},
	telephoneNumber: contactInfo.Phone
}) if(!isEmpty(contactInfo.Phone))]