%dw 2.0
output application/json
fun getFormattedDateTime(toFormat) =(toFormat as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSSz"} as String {format: "yyyy-MM-dd'T'HH:mm:ssz"} default null)
var contactInfo=vars.contactReturned
---

[({
	"contactPointType": ["ContactPointAddress"],
	id: null,
	activeFromDate: now() as Date {format: "yyyy-MM-dd"},
	addressLine1: contactInfo.MailingStreet,
	cityName: contactInfo.MailingCity default "",
	postalCodeText: contactInfo.MailingPostalCode default "",
	stateProvinceName: contactInfo.MailingState default "",
	countryName: contactInfo.MailingCountry default "",
	geoLatitude: contactInfo.MailingLatitude default null,
	geoLongitude: contactInfo.MailingLongitude default null,
	geoAccuracy: contactInfo.MailingGeocodeAccuracy default null
}) if(!isEmpty(contactInfo.MailingStreet)),
({
	"contactPointType": ["ContactPointEmail"],
	id: null,
	activeFromDate: now() as Date {
		format: "yyyy-MM-dd"
	},
	emailAddress: contactInfo.Email
}) if(!isEmpty(contactInfo.Email)),
({
	"contactPointType": ["ContactPointPhone"],
	id: null,
	activeFromDate: now() as Date {
		format: "yyyy-MM-dd"
	},
	telephoneNumber: contactInfo.Phone
}) if(!isEmpty(contactInfo.Phone))]