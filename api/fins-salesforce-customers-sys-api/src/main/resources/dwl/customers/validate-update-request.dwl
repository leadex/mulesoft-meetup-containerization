%dw 2.0
output application/json
fun filterEmptyOrNullValues(arrayToFilter)= arrayToFilter filter ((item, index) -> (!isBlank(item)))
var contactPoints=(payload.party filter((lower($.partyType)) == p('customer.party-type-individual')))[0].contactPoints
var contactPointPhonePhNumber = (contactPoints filter (($.contactPointType) contains("ContactPointPhone"))map $.telephoneNumber) default []
var  contactPointEmailAddresses=(contactPoints filter (($.contactPointType) contains("ContactPointEmail"))map $.emailAddress) default [] 
var  contactPointAddresses= (contactPoints filter (($.contactPointType) contains("ContactPointAddress"))map $.addressLine1) default []
---
(lower(payload.partyRoleType) == "customer") and
 !isEmpty(payload.party filter((lower($.partyType)) == p('customer.party-type-individual'))) and
sizeOf(contactPointPhonePhNumber) == sizeOf(filterEmptyOrNullValues(contactPointPhonePhNumber)) and
sizeOf(contactPointEmailAddresses) == sizeOf(filterEmptyOrNullValues(contactPointEmailAddresses)) and
sizeOf(contactPointAddresses) == sizeOf(filterEmptyOrNullValues(contactPointAddresses)) 
 
 