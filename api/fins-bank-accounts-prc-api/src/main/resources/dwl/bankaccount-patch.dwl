/**
 * This transformation produces an Update SF FinancialAccount from a FIS Account. The FIS Id is replaced with a SF Id.
 */
%dw 2.0
import * from dw::util::Values
output application/json
---
(vars.fisAccount filterObject (!isEmpty($)) update "id" with vars.fscAccountId)
update "primaryAccountOwner" with vars.sfPrimaryAccountOwner[0].id