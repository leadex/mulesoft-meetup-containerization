%dw 2.0
output application/json
---
payload.token_type ++ " " ++ payload.access_token	
