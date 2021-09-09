/**
 * This transformation produces a Create SF Person Account from a FIS Customer. The FIS Id is moved to externalIds.
 */
%dw 2.0
import * from dw::util::Values
output application/json
---
(vars.fisCustomer update "id" with null)
++ {
	externalIds: [
		{
			"externalIdType": [
				"FIS",
				"MDM"
			],
			"id": payload.id,
			"externalId": payload.id,
			"status": "VALID"
		}
	]
}