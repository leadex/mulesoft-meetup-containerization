/**
 * This transformation produces a Create SF FinancialAccountTransaction from a FIS Customer. The FIS Id is moved to externalIds.
 */
%dw 2.0
import * from dw::util::Values
output application/json
---
((vars.fisTransaction filterObject (!isEmpty($)) update "id" with null)
update "postedDate" with vars.fisTransaction.postedDate as Date)
++ {
	"externalIds": (vars.fisTransaction.externalIds default []) ++ [
		{
			"id": null,
			"externalIdType": [ "FIS" ],
			"externalId": vars.fisTransaction.id,
			"status": "VALID"
		}
	]
}