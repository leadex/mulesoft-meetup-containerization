%dw 2.0
output application/java
---
vars.outboundHeaders default {} ++ {
	Location : ("/contacts/" ++ (vars.createdContact.items[0].id as String))
}