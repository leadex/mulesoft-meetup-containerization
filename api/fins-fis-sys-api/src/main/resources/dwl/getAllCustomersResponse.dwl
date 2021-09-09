%dw 2.0
output application/json
---
payload.CustomerList map {
    "id": $.customerId as String,
    "partyRoleType": "Customer",
    "party": [ {
        "id": null,
        "partyType": "Individual",
        "personName": $.NameFull,
        "firstName": $.firstName,
        "lastName": $.lastName,
        "birthDate" : $.dateOfBirth,
        "saluation" : "",
        "gender" : "",
        "middleName" : $.middleName,
        "mothersMaidenName" : "",
        "contactPoints": [ 
        	{
	            "id": null,
	            "contactPointType": [ "ContactPointAddress" ],
	            "activeFromDate": now() as Date {format: "yyyy-MM-dd"},
	            "primaryFlag": true,
	            "addressLine1": $.addresslineFull,
	            "cityName": $.city,
	            "stateProvinceName": $.state,
	            "countryName": $.country,
	            "postalCodeText": $.ZipCode
	        },
	        ({
	            "id": null,
	            "contactPointType": [ "ContactPointEmail"],
	            "activeFromDate": now() as Date {format: "yyyy-MM-dd"},
	            "primaryFlag": true,
	            "emailAddress": $.emailAddress
	        }) if !isEmpty($.emailAddress),
	        ({
	            "id": null,
	            "contactPointType": [
	            "ContactPointPhone"
	            ],
	            "activeFromDate": now() as Date {format: "yyyy-MM-dd"},
	            "primaryFlag": true,
	            "telephoneNumber": $.homePhone
	        }) if !isEmpty($.homePhone)
        ]
      }],
	  "customerNumber": $.taxIdNumber,
	  "customerStatus": "ACTIVE",
	  "auditInfo": {
		    "createdDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
		    "createdBy": "system",
		    "updatedDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
		    "updatedBy": "system",
		    "isDeleted": false
	  	}
}