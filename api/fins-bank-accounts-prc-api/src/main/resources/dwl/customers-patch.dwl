/**
 * This transformation produces an Update SF Person Account from a FIS Customer. TThe FIS Id is replaced with a SF Id.
 */
%dw 2.0
import * from dw::util::Values
output application/json
---
vars.fisCustomer update "id" with vars.fscCustomerId