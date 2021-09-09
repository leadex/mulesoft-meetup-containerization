%dw 2.0
fun fixStatus(st) = if (st == 'OK') 'UP' else st
output application/java
---
[
	{
	'name': if (!isEmpty(payload)) payload.apiName else 'fins-bank-accounts-prc-api',
	'status': if (!isEmpty(payload)) fixStatus(payload.status) else vars.backendSystemStatus
	}
] ++ (
	if (!isEmpty(payload) and !isEmpty(payload.dependencies)) payload.dependencies else []
)
