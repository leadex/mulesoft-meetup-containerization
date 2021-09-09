/**
 * Salesforce Create AccountContactRelation mapping
 */
%dw 2.0
output application/java
var sfRolesMap = [
    "OTHER": "Other", 
    "SPONSOR": "Executive Sponsor",
    "USER": "Business User", 
    "AGENT": "Other", 
    "BUYER": "Economic Buyer", 
    "CHILD": "Other", 
    "CLIENT": "Other", 
    "RELATION": "Other", 
    "SPONSOR": "Other", 
    "SPOUSE": "Other", 
    "SUPPLIER": "Other", 
    "VENDOR": "Other"
]
---
/**
 * Maps CIM PartyRelatedParty to Salesforce AccountContactRelation
 * @table Salesforce,CIM,Description
 * @row Id,id, The identifier of the AccountContactRelation record in Salesforce
 * @row AccountId,party.id,The identifier of the associated Account
 * @row ContactId,relatedParty.id,The identifier of the associated contact
 * @row Roles,partyRelationshipType, The Relationship type of Account and Contact
 * @row StartDate, relatedFromDate, The date from which Account and Contact are related
 * @row EndDate,relatedEndDate, The date till which Account and Contact are related
 */
[{
	("Id": vars.accountContactRelation.Id) if(!isEmpty(vars.accountContactRelation.Id)),
	"AccountId": vars.customerId,
	"ContactId": vars.contactId,
	"Roles": payload.partyRelationshipType map sfRolesMap[$][0] distinctBy $ joinBy  ";",
	"StartDate": (payload.relatedFromDate  default now()) as Date {
		"format":"yyyy-MM-dd"},
	"EndDate": (payload.relatedEndDate default now()) as Date {
		"format":"yyyy-MM-dd"}
}]