%dw 2.0
output application/java
---
vars.outboundHeaders default {} ++ {
	Location : ("/accounts/" ++ (vars.accountId as String) ++ "/transactions/" ++ (payload.items[0].payload.id as String))
}