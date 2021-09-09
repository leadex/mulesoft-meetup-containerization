/**
 * This component generates a parameterized SOQL WHERE clause as a String, containing conditions for each provided optional query parameter.
 * It also includes LIMIT and OFFSET clauses.
 */

%dw 2.0

/**
 * A list of the SOQL conditions for filtering records, based on the provided optional parameters. The conditions are joined with AND operators.
 */
var conditions = ( []
	++ (if(not isEmpty(vars.queryParams.customerId))
		["FinServ__PrimaryOwner__c = ':customerId'"] else [])
	++ (if(not isEmpty(vars.queryParams.externalId))
		["Global_Account_Id__c = ':externalId'"] else [])
	++ (if(not isEmpty(vars.queryParams.fromDate))
		["LastModifiedDate >= :fromDate"] else [])
	++ (if(not isEmpty(vars.queryParams.toDate))
		["LastModifiedDate <= :toDate"] else [])
)

output application/java
---
(if(not isEmpty(conditions))
	" WHERE " ++ (conditions joinBy " AND ")
else "")
++ (if(not isEmpty(vars.queryParams.limit))
	" LIMIT :limit" else "")
++ (if(not isEmpty(vars.queryParams.offset))
	" OFFSET :offset" else "")