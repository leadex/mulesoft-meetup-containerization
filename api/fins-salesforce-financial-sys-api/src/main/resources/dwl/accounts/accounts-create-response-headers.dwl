/**
 * This module returns a Location header containing the path to retrieve the Account.
 */
%dw 2.0
output application/java
---
vars.outboundHeaders default {} ++ {
	Location : ("/accounts/" ++ (vars.accountId as String))
}