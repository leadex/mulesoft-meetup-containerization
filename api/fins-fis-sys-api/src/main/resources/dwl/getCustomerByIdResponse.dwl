%dw 2.0
output application/json
---
[{
    "id": vars.customerId,
    "partyRoleType": "Customer",
    "party": [ {
        "id": null,
        "partyType": "Individual",
        "personName": vars.customerData.Entity.customer.CIFrstNmeMidInitl default "" ++ " " ++ vars.customerData.Entity.customer.CISrnme default "",
        "firstName": vars.customerData.Entity.customer.CIFrstNmeMidInitl,
        "lastName": vars.customerData.Entity.customer.CISrnme,
        "birthDate" : vars.customerData.Entity.customer.CIBirthdate,
        "saluation" : "",
        "gender" : "",
        "middleName" : "",
        "mothersMaidenName" : vars.customerData.Entity.customer.CIMothersMdnNme,
        "contactPoints": [ 
        	{
	            "id": null,
	            "contactPointType": [ "ContactPointAddress" ],
	            "activeFromDate": now() as Date {format: "yyyy-MM-dd"},
	            "primaryFlag": true,
	            "addressLine1": vars.customerData.Entity.customer.CICurStdAddr1Txt as String,
	            "cityName": vars.customerData.Entity.customer.Cty,
	            "stateProvinceName": vars.customerData.Entity.customer.St,
	            "countryName": vars.customerData.Entity.customer.CtryCde,
	            "postalCodeText": vars.customerData.Entity.customer.ZIP as String
	        },
	        ({
	            "id": null,
	            "contactPointType": [
	            "ContactPointEmail"
	            ],
	            "activeFromDate": vars.contactPoints.Entity.IpPoc.EmailAddrInq[0].StrtDte as Date,
	            "primaryFlag": true,
	            "emailAddress": vars.contactPoints.Entity.IpPoc.EmailAddrInq[0].Addr
	        }) if !isEmpty(vars.contactPoints.Entity.IpPoc.EmailAddrInq[0].Addr),
	        ({
	            "id": null,
	            "contactPointType": [
	            "ContactPointPhone"
	            ],
	            "activeFromDate": vars.contactPoints.Entity.IpPoc.PhInq[0].StrtDte as Date,
	            "primaryFlag": true,
	            "telephoneNumber": vars.contactPoints.Entity.IpPoc.PhInq[0].Nbr as String
	        }) if !isEmpty(vars.contactPoints.Entity.IpPoc.PhInq[0].Nbr)
        ]
      }],
	  "customerNumber": vars.customerData.Entity.customer.CICustTaxNbr as String,
	  "customerStatus": "ACTIVE",
	  "auditInfo": {
		    "createdDate": vars.customerData.Entity.customer.CICustOpenDte ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
		    "createdBy": "system",
		    "updatedDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
		    "updatedBy": "system",
		    "isDeleted": false
	  	}
}] 