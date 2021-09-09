/**
 * This transformation produces a Create SF FinancialAccount from a FIS Account. The FIS Id is moved to externalIds.
 */
%dw 2.0
import * from dw::util::Values
output application/json
---
((vars.fisAccount filterObject (!isEmpty($)) update "id" with null)
update "primaryAccountOwner" with vars.sfPrimaryAccountOwner[0].id)
++ {
	"externalIds": (vars.fisAccount.externalIds default []) ++ [
		{
			"id": null,
			"externalIdType": [ "FIS" ],
			"externalId": vars.fisAccount.id,
			"status": "VALID"
		}
	]
}