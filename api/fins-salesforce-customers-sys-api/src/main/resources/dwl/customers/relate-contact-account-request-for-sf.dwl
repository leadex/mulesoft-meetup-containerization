/**
 * Salesforce Relate Private Contact with Account mapping
 */
%dw 2.0
output application/json skipNullOn = "everywhere"
---
[{
	Id: vars.contactId,
	AccountId: vars.customerId
}]