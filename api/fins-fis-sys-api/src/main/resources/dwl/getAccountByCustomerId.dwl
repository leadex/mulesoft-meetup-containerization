%dw 2.0
output application/json
---
payload."acctList" map {
  "id": $.accountId,
  "name": $.productDescription,
  "accountNumber": $.accountId,
  "accountType": if ($.accountType == "SAV") "SavingsAccount" else "CheckingAccount",
  "primaryAccountOwner": vars.customerId,
  "secondaryAccountOwners": "",
  "accountStatus": if ($.status == "Active") "OPEN" else "ON_HOLD",
  "accountBalance": $.balance,
  "availableBalance": $.availableBalance,
  "accountCurrency": $.currencyCode,
  "accountLabel": $.productDescription,
  "interestRate": null,
  "taxIdentificationNumber": "",
  "openedDate": $.dateOpened,
  "closedDate": null,
  "auditInfo": {
    "createdDate": "2020-03-15T15:03:01Z",
    "createdBy": "system",
    "updatedDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
    "updatedBy": "system",
    "isDeleted": false
  }
}
