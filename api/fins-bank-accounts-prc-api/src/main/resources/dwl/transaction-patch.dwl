/**
 * This transformation produces an Update SF FinancialAccountTransaction from a FIS Transaction. The FIS Id is replaced with a SF Id.
 */
%dw 2.0
import * from dw::util::Values
output application/json
---
(vars.fisTransaction filterObject (!isEmpty($)) update "id" with vars.fscTransactionId)
update "postedDate" with vars.fisTransaction.postedDate as Date