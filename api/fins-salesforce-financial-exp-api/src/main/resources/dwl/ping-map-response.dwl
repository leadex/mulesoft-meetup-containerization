%dw 2.0
output application/json
fun getDependencyStatus(dependencies) = if(sizeOf(dependencies.*status find 'UP') == sizeOf(dependencies))
	'OK'
else if (sizeOf(dependencies.*status find 'DOWN') == sizeOf(dependencies))
    'OFFLINE'
else
    'DEGRADED'
---
{
	status: if((vars.checkDependencies == true) and (not isEmpty(vars.dependencyList))) getDependencyStatus(vars.dependencyList) else 'OK',
	apiName: p('api.name') default app.name,
	apiVersion: p('api.version') default '',
	(dependencies: vars.dependencyList map(item) -> {
		name: item.name default '',
		status: item.status default ''
	})
	if(not isEmpty(vars.dependencyList)) 
}
