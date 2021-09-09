/**
 * Salesforce AccountContactRelation mapping to  CIM PartyRelatedParty
 */

%dw 2.0
output application/json

var cimRelationshipTypesMap =
[
"Evaluator": "OTHER",
"Executive Sponsor": "SPONSOR",
"Business User": "USER",
"Economic Buyer": "BUYER",
"Economic Decision Maker": "OTHER",
"Other": "OTHER",
"Decision Maker": "OTHER",
"Technical Buyer": "OTHER",
"Influencer": "OTHER"
]
---
/**
 * Maps Salesforce AccountContactRelation to  CIM PartyRelatedParty
 * @table CIM,Salesforce,Description
 * @row id,Id, The identifier of the AccountContactRelation record in Salesforce
 * @row partyRelationshipType,Roles, The Relationship type of Account and Contact
 * @row relatedParty.id,ContactId, The identifier of the associated contact
 * @row partyType,"Individual", The type of Party set as Individual
 * @row party.id,AccountId, The identifier of the associated Account
 * @row partyType,"Organization", The type of Party set as Organization
 * @row relatedFromDate,StartDate, The date from which Account and Contact are related
 * @row relatedEndDate,EndDate, The date till which Account and Contact are related
 */
vars.relatedContacts map {
	partyRelationshipType: ($.Roles splitBy ";") map cimRelationshipTypesMap[$][0] default ["OTHER"],
	id: $.Id,
	relatedParty: [{
		id: $.ContactId,
		partyType: "Individual"
	}],
	party: [{
		id: $.AccountId,
		partyType: "Organization"
		}],
	relatedFromDate: ($.StartDate default now()) as Date {
		format: "yyyy-MM-dd"
	},
	(relatedEndDate: $.EndDate as Date {format: "yyyy-MM-dd"}) if(!isEmpty($.EndDate))
} default []
