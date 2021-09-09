%dw 2.0
var acc = payload."DepAcctDetails"
output application/json
---
{
  "id": vars.accountId,
  "name": acc.productDescription,
  "accountNumber": acc.accountId,
  "accountType": if (acc.accountType == "SAV") "SavingsAccount" else "CheckingAccount",
  "primaryAccountOwner": vars.customerId,
  "secondaryAccountOwners": "",
  "accountStatus": if (acc.status == "Active") "OPEN" else "ON_HOLD",
  "accountBalance": acc.balance,
  "availableBalance": acc.availableBalance,
  "accountCurrency": acc.currencyCode,
  "accountLabel": acc.productDescription,
  "interestRate": null,
  "taxIdentificationNumber": "",
  "openedDate": acc.dateOpened,
  "closedDate": null,
  "auditInfo": {
    "createdDate": "2020-03-15T15:03:01Z",
    "createdBy": "system",
    "updatedDate": now() as String {format : "uuuu-MM-dd"} ++ "T" ++ now()as String {format : "hh:mm:ss"} ++ "Z",
    "updatedBy": "system",
    "isDeleted": false
  }
}
