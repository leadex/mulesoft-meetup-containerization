%dw 2.0
fun getDependencyStatus(dependencyResponse) = if(sizeOf(dependencyResponse.status find "UP") == sizeOf(dependencyResponse))
    "OK"
else if (sizeOf(dependencyResponse.status find "DOWN") == sizeOf(dependencyResponse))
    "OFFLINE"
else
    "DEGRADED"
output application/json
---
{
	status: if(vars.checkDependencies == true) getDependencyStatus(vars.dependencyList) else "OK",
	apiName: p("api.name") default "",
	apiVersion: p("api.version") default "",
	(dependencies: vars.dependencyList map(item) -> {
		name: item.name default "",
		status: item.status default ""
	})
	if(vars.dependencyList != null)
} 