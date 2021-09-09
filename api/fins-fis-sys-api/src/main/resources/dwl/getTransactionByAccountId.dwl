%dw 2.0
var debit = payload."acctTranList" filter ($.isDebit) 
var credit = payload."acctTranList" filter ($.isCredit) 
output application/json
---
[{
  "id": debit[0].tranCode,
  "name": debit[0].description,
  "description": debit[0].description,
  "amount": debit[0].amount,
  "transactionDate": debit[0].datePosted ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
  "transactionType": "DebitTransaction",
  "transactionSubType": if (debit[0].checkNumber?) "CHECK" else "ATM",
  "transactionStatus": "POSTED",
  "postedDate": debit[0].datePosted as Date,
  "vendorName": "",
  "isDisputed": false,
  "disputedReason": "",
  "notes": "",
  "auditInfo": {
    "createdDate": "2020-03-15T15:03:01Z",
    "createdBy": "system",
    "updatedDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
    "updatedBy": "system",
    "isDeleted": false
  }
},
{
  "id": debit[0].tranCode,
  "name": credit[0].description,
  "description": credit[0].description,
  "amount": credit[0].amount,
  "transactionDate": credit[0].datePosted ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
  "transactionType": "CreditTransaction",
  "transactionSubType": if (debit[0].checkNumber?) "CHECK" else "ATM",
  "transactionStatus": "POSTED",
  "postedDate": credit[0].datePosted as Date,
  "vendorName": "",
  "isDisputed": null,
  "disputedReason": "",
  "notes": "",
  "auditInfo": {
    "createdDate": "2020-03-15T15:03:01Z",
    "createdBy": "system",
    "updatedDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
    "updatedBy": "system",
    "isDeleted": false
  }, 
}]