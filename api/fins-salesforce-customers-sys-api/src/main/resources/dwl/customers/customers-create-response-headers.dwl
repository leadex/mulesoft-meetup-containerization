%dw 2.0
output application/java
---
vars.outboundHeaders default {} ++ {
	Location : ("/customers/" ++ (vars.createdCustomer.items[0].id as String))
}