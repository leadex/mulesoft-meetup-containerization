# customers-create-success

# retrieve-related-contacts-by-customerid-response
Salesforce AccountContactRelation mapping to  CIM PartyRelatedParty

## Variables

__var__ `s`
> Maps Salesforce AccountContactRelation to  CIM PartyRelatedParty  


## Mapping Tables

Maps Salesforce AccountContactRelation to CIM PartyRelatedParty 

> | CIM | Salesforce | Description | 
> | ---- |---- |---- |
> | id | Id |  The identifier of the AccountContactRelation record in Salesforce | 
> | partyRelationshipType | Roles |  The Relationship type of Account and Contact | 
> | relatedParty.id | ContactId |  The identifier of the associated contact | 
> | partyType | "Individual" |  The type of Party set as Individual | 
> | party.id | AccountId |  The identifier of the associated Account | 
> | partyType | "Organization" |  The type of Party set as Organization | 
> | relatedFromDate | StartDate |  The date from which Account and Contact are related | 
> | relatedEndDate | EndDate |  The date till which Account and Contact are related | 


# search-customers-response
Salesforce Account to CIM Customer format mapping response

## Variables

__var__ `s`
> Maps Salesforce Account to CIM Customer format  
The CIM Customer (PartyRole) can have either Individual or Organization as Party.   
The Salesforce PersonAccount is mapped as a Customer with Party as Individual in CIM.  
The Salesforce Account is mapped as a Customer with Party as Organization in CIM.  


## Mapping Tables

Maps Salesforce Account to CIM Customer format The CIM Customer (PartyRole) can have either Individual or Organization as Party. The Salesforce PersonAccount is mapped as a Customer with Party as Individual in CIM. The Salesforce Account is mapped as a Customer with Party as Organization in CIM. 

> | CIM | Salesforce Person Account | Description | 
> | ---- |---- |---- |
> | partyRoleType | Customer |  Hardcoded partyrole to customer | 
> | id | customerId |  The customer Id | 
> | party.id | id |  The party Id is hardcoded to null | 
> | party.salutation | Salutation |  The customer salutation | 
> | party.personName | FirstName ++ LastName |  The customer personal name (concatenate FistName + LastName) | 
> | party.firstName | FirstName |  The customer first name | 
> | party.lastName | LastName |  The customer Last name | 
> | party.birthDate | PersonBirthdate |  The customer birth date | 
> | party.partyType | Individual |  The customer party type hardcoded as Individual or Organization | 
> | contactPointType | ContactPointAddress |  Hardcoded customer contact type to ContactPointAddress | 
> | id | PersonContactId | The customer Id | 
> | activeFromDate | todays date |  The customer Active from date is hardcoded to Todays date | 
> | addressLine1 | PersonMailingStreet | The customers mailing address | 
> | cityName | PersonMailingCity | The customers mailing city | 
> | postalCodeText | PersonMailingPostalCode | The customer mailing postal code | 
> | stateProvinceName | PersonMailingState | The customer state province name | 
> | countryName | PersonMailingCountry | The customer country name | 
> | geoLatitude | PersonMailingLatitude | The customer geo-latitude code | 
> | geoLongitude | PersonMailingLongitude | The customer geo-longitude code | 
> | geoAccuracy | PersonMailingGeocodeAccuracy | The customer geo-code accurate location | 
> | contactPointType | ContactPointEmail |  Hardcoded customer contact type to ContactPointEmail | 
> | id | PersonContactId | The customer id | 
> | activeFromDate | todays date | The customer Active from date is hardcoded to todays date | 
> | emailAddress | PersonEmail |  The customer contact email address | 
> | contactPointType | ContactPointPhone | Hardcoded customer contact type to ContactPointPhone | 
> | contactPointType | PersonContactId | The customer id | 
> | activeFromDate | todays date |  The customer Active from date is hardcoded to todays date | 
> | telephoneNumber | Phone | The customer phone number | 
> | externalIds.id | id |  Id field is hardcoded as empty string | 
> | externalIds.externalId | Global_Customer_Id__c |  The customer Global Id | 
> | externalIds.externalIdType | MDM | The customer is hardcoded as MDM | 
> | externalIds.statusLastChangedDate | LastModifiedDate |  Last modified date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | externalIds.status | VALID | The customer status is hardcoded as VALID | 
> | auditInfo.createdDate | CreatedDate | The customer created date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | auditInfo.createdBy | CreatedBy.Name | The last created by user name | 
> | auditInfo.updatedDate | LastModifiedDate |  The last updated date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | auditInfo.updatedBy | LastModifiedBy.Name |  The last modified user name | 
> | auditInfo.isDeleted | IsDeleted |  returns true if user deleted else false | 
> | customerNumber | AccountNumber |  The customer Account Number | 
> | customerStatus | ACTIVE |  Hardcoded as ACTIVE | 


# relate-contact-account-request-for-sf
Salesforce Relate Private Contact with Account mapping

# map-contactpoints-for-customer

# update-customers-request-for-sf
Salesforce Person Account update  mapping

## Mapping Tables

Maps CIM format to Salesforce Account Object 

> | Salesforce Person Account | CIM | Description | 
> | ---- |---- |---- |
> | Id | customerId | The customer Id from the Uriparams | 
> | Salutation | party.salutation | The salutation of the customer | 
> | FirstName | party.firstName | The First Name of the customer | 
> | lastName | party.LastName | The Last Name of the customer | 
> | PersonBirthDate | party.birthDate | The birth date of the customer | 
> | AccountNumber | customerNumber | The customer Account Number | 
> | Global_Customer_Id__c | externalIds.externalId | The Global-Id of the customer when externalIdType matches MDM | 


# update-account-contact-relation
Salesforce Update AccountContactRelation mapping

## Mapping Tables

Maps CIM PartyRelatedParty to Salesforce AccountContactRelation 

> | Salesforce | CIM | Description | 
> | ---- |---- |---- |
> | Id | id |  The identifier of the AccountContactRelation record in Salesforce | 
> | Roles | partyRelationshipType |  The Relationship type of Account and Contact | 
> | StartDate |  relatedFromDate |  The date from which Account and Contact are related | 
> | EndDate | relatedEndDate |  The date till which Account and Contact are related | 


# retrieve-customer-by-id-response
Salesforce Person Account to CIM Customer format mapping

## Mapping Tables

Maps Salesforce Account to CIM Customer format The CIM Customer (PartyRole) can have either Individual or Organization as Party. The Salesforce PersonAccount is mapped as a Customer with Party as Individual in CIM. The Salesforce Account is mapped as a Customer with Party as Organization in CIM. 

> | CIM | Salesforce Person Account | Description | 
> | ---- |---- |---- |
> | partyRoleType | Customer |  Hardcoded partyrole to customer | 
> | id | customerId |  The customer Id | 
> | party.id | id |  The party Id is hardcoded to null | 
> | party.salutation | Salutation |  The customer salutation | 
> | party.personName | FirstName ++ LastName |  The customer personal name (concatenate FistName + LastName) | 
> | party.firstName | FirstName |  The customer first name | 
> | party.lastName | LastName |  The customer Last name | 
> | party.birthDate | PersonBirthdate |  The customer birth date | 
> | party.partyType | Individual |  The customer party type hardcoded as Individual or Organization | 
> | contactPointType | ContactPointAddress |  Hardcoded customer contact type to ContactPointAddress | 
> | id | PersonContactId | The customer Id | 
> | activeFromDate | todays date |  The customer Active from date is hardcoded to Todays date | 
> | addressLine1 | PersonMailingStreet | The customers mailing address | 
> | cityName | PersonMailingCity | The customers mailing city | 
> | postalCodeText | PersonMailingPostalCode | The customer mailing postal code | 
> | stateProvinceName | PersonMailingState | The customer state province name | 
> | countryName | PersonMailingCountry | The customer country name | 
> | geoLatitude | PersonMailingLatitude | The customer geo-latitude code | 
> | geoLongitude | PersonMailingLongitude | The customer geo-longitude code | 
> | geoAccuracy | PersonMailingGeocodeAccuracy | The customer geo-code accurate location | 
> | contactPointType | ContactPointEmail |  Hardcoded customer contact type to ContactPointEmail | 
> | id | PersonContactId | The customer id | 
> | activeFromDate | todays date | The customer Active from date is hardcoded to todays date | 
> | emailAddress | PersonEmail |  The customer contact email address | 
> | contactPointType | ContactPointPhone | Hardcoded customer contact type to ContactPointPhone | 
> | contactPointType | PersonContactId | The customer id | 
> | activeFromDate | todays date |  The customer Active from date is hardcoded to todays date | 
> | telephoneNumber | Phone | The customer phone number | 
> | externalIds.id | id |  Id field is hardcoded as empty string | 
> | externalIds.externalId | Global_Customer_Id__c |  The customer Global Id | 
> | externalIds.externalIdType | MDM | The customer is hardcoded as MDM | 
> | externalIds.statusLastChangedDate | LastModifiedDate |  Last modified date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | externalIds.status | VALID | The customer status is hardcoded as VALID | 
> | auditInfo.createdDate | CreatedDate | The customer created date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | auditInfo.createdBy | CreatedBy.Name | The last created by user name | 
> | auditInfo.updatedDate | LastModifiedDate |  The last updated date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | auditInfo.updatedBy | LastModifiedBy.Name |  The last modified user name | 
> | auditInfo.isDeleted | IsDeleted |  returns true if user deleted else false | 
> | customerNumber | AccountNumber |  The customer Account Number | 
> | customerStatus | ACTIVE |  Hardcoded as ACTIVE | 


# customers-create-response-headers

# create-account-contact-relation
Salesforce Create AccountContactRelation mapping

## Mapping Tables

Maps CIM PartyRelatedParty to Salesforce AccountContactRelation 

> | Salesforce | CIM | Description | 
> | ---- |---- |---- |
> | Id | id |  The identifier of the AccountContactRelation record in Salesforce | 
> | AccountId | party.id | The identifier of the associated Account | 
> | ContactId | relatedParty.id | The identifier of the associated contact | 
> | Roles | partyRelationshipType |  The Relationship type of Account and Contact | 
> | StartDate |  relatedFromDate |  The date from which Account and Contact are related | 
> | EndDate | relatedEndDate |  The date till which Account and Contact are related | 


# update-organization-account-request-for-sf
Salesforce Organization Account update  mapping

## Mapping Tables

Maps CIM format to Salesforce Account Object 

> | Salesforce Person Account | CIM | Description | 
> | ---- |---- |---- |
> | Id | customerId | The customer Id from the Uriparams | 
> | Salutation | party.salutation | The salutation of the customer | 
> | FirstName | party.firstName | The First Name of the customer | 
> | lastName | party.LastName | The Last Name of the customer | 
> | PersonBirthDate | party.birthDate | The birth date of the customer | 
> | AccountNumber | customerNumber | The customer Account Number | 
> | Global_Customer_Id__c | externalIds.externalId | The Global-Id of the customer when externalIdType matches MDM | 


# validate-create-request

# create-customer-request
Salesforce Person Account create  mapping

## Mapping Tables

Maps CIM Customer format to Salesforce Person Account Object 

> | Salesforce Person Account | CIM | Description | 
> | ---- |---- |---- |
> | Salutation | party.salutation | The salutation of the customer | 
> | FirstName | party.firstName | The First Name of the customer | 
> | lastName | party.LastName | The Last Name of the customer | 
> | PersonBirthDate | party.birthDate | The birth date of the customer | 
> | Global_Customer_Id__c | externalIds.externalId | The Global-Id of the customer when externalIdType matches MDM | 
> | RecordTypeId | recordTypeId | The Salesforce record Id for creating a customer | 
> | AccountNumber | customerNumber | The customer Account Number | 
> | PersonMailingStreet | party.contactPointAddress.addressLine1 | The mailing Address of the customer | 
> | PersonMailingCity | party.contactPointAddress.cityName | The mailing city of the customer | 
> | PersonMailingPostalCode | party.contactPointAddress.postalCodeText | The mailing postal code of the customer | 
> | PersonMailingState | party.contactPointAddress.stateProvinceName | The customer mailing state | 
> | PersonMailingCountry | party.contactPointAddress.countryName | The customer mailing country | 
> | PersonMailingLatitude | party.contactPointAddress.geoLatitude | The customer geo lattitude location | 
> | PersonMailingLongitude | party.contactPointAddress.geoLongitude | The customer geo logitude location | 
> | PersonEmail | party.ContactPointEmail.emailAddress | The customer contact email | 
> | Phone | party.ContactPointPhone.telephoneNumber | The customer contact phone Number | 


# validate-update-request

# create-organization-account-request
Salesforce Organization Account create  mapping

## Mapping Tables

Maps CIM Customer format to Salesforce Person Account Object 

> | Salesforce Person Account | CIM | Description | 
> | ---- |---- |---- |
> | Name | party.name | The Name of the Organization | 
> | FirstName | party.firstName | The First Name of the customer | 
> | lastName | party.LastName | The Last Name of the customer | 
> | PersonBirthDate | party.birthDate | The birth date of the customer | 
> | Global_Customer_Id__c | externalIds.externalId | The Global-Id of the customer when externalIdType matches MDM | 
> | RecordTypeId | recordTypeId | The Salesforce record Id for creating a customer | 
> | AccountNumber | customerNumber | The customer Account Number | 
> | BillingStreet | party.contactPointAddress.addressLine1 | The mailing Address of the customer | 
> | BillingCity | party.contactPointAddress.cityName | The mailing city of the customer | 
> | BillingPostalCode | party.contactPointAddress.postalCodeText | The mailing postal code of the customer | 
> | BillingState | party.contactPointAddress.stateProvinceName | The customer mailing state | 
> | BillingCountry | party.contactPointAddress.countryName | The customer mailing country | 
> | BillingLatitude | party.contactPointAddress.geoLatitude | The customer geo lattitude location | 
> | BillingLongitude | party.contactPointAddress.geoLongitude | The customer geo logitude location | 
> | PersonEmail | party.ContactPointEmail.emailAddress | The customer contact email | 
> | Phone | party.ContactPointPhone.telephoneNumber | The customer contact phone Number | 


# ping-check-dependency-sys-api-response

# retrieve-contact-by-id-response
Salesforce Contact to CIM Individual format mapping

## Mapping Tables

Maps Salesforce Contact to CIM Individual format 

> | CIM | Salesforce Contact | Description | 
> | ---- |---- |---- |
> | id | id |  The identifier of the contact in Salesforce | 
> | salutation | Salutation |  The salutation of the contact | 
> | personName | Name |  The name of the contact | 
> | firstName | FirstName |  The first name of the contact | 
> | lastName | LastName |  The Last name of the contact | 
> | birthDate | Birthdate |  The birth date of the contact | 
> | partyType | Individual |  The contact party set as "Individual" | 
> | contactPointType | ContactPointAddress | contactPointType set as "ContactPointAddress" | 
> | id | null | The contactPointAddress id set as null | 
> | activeFromDate | now() |  The date from which the contactpoint is active - Set as current date | 
> | addressLine1 | MailingStreet | The mailing address of the contact | 
> | cityName | MailingCity | The mailing city of the contact | 
> | postalCodeText | MailingPostalCode | The contact mailing postal code | 
> | stateProvinceName | MailingState | The contact state province name | 
> | countryName | MailingCountry | The country name of the contact | 
> | geoLatitude | MailingLatitude | The geo-latitude code of the contact | 
> | geoLongitude | MailingLongitude | The geo-longitude code of the contact  | 
> | geoAccuracy | MailingGeocodeAccuracy | The geo-code accurate location of the contact  | 
> | contactPointType | ContactPointEmail |  contactPointType set as "ContactPointEmail" | 
> | id | null | The contactpoint id set as null | 
> | activeFromDate | now() |  The date from which the contactpoint is active - Set as current date | 
> | emailAddress | Email |  The email address of the contact  | 
> | contactPointType | ContactPointPhone | contactPointType - set as "ContactPointPhone" | 
> | contactPointType | ContactId | The contactpoint id - set as null | 
> | activeFromDate | now() |  The date from which the contactpoint is active - Set as current date | 
> | telephoneNumber | Phone | The phone number of the contact | 
> | externalIds.id | id |  Id field is hardcoded as empty string | 
> | externalIds.externalId | Global_Individual_Id__c |  The identifier of the contact in MDM system | 
> | externalIds.externalIdType | MDM | The externalId Type set as "MDM" | 
> | externalIds.statusLastChangedDate | LastModifiedDate |  Last modified date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | externalIds.status | VALID | The externalId status is set as VALID | 
> | auditInfo.createdDate |  CreatedDate | Timestamp of when the contact was created  | 
> | auditInfo.createdBy |  CreatedBy.Name | Identifies the system or user which created the contact | 
> | auditInfo.updatedDate |  LastModifiedDate | Timestamp of when the contact was last updated | 
> | auditInfoupdatedBy |  LastModifiedBy.Name | Identifies the system or user which last updated the contact | 
> | auditInfo.isDeleted |  IsDeleted | Indicates whether or not the contact has been soft-deleted | 


# contact-create-success

# lookup-contacts-response
Salesforce Contact to CIM Individual mapping response

## Variables

__var__ `s`
> Maps Salesforce Contact to CIM Individual format  


## Mapping Tables

Maps Salesforce Contact to CIM Individual format 

> | CIM | Salesforce Contact | Description | 
> | ---- |---- |---- |
> | id | id |  The identifier of the contact in Salesforce | 
> | salutation | Salutation |  The salutation of the contact | 
> | personName | Name |  The name of the contact | 
> | firstName | FirstName |  The first name of the contact | 
> | lastName | LastName |  The Last name of the contact | 
> | birthDate | Birthdate |  The birth date of the contact | 
> | partyType | Individual |  The contact party set as "Individual" | 
> | contactPointType | ContactPointAddress | contactPointType set as "ContactPointAddress" | 
> | id | null | The contactPointAddress id set as null | 
> | activeFromDate | now() |  The date from which the contactpoint is active - Set as current date | 
> | addressLine1 | MailingStreet | The mailing address of the contact | 
> | cityName | MailingCity | The mailing city of the contact | 
> | postalCodeText | MailingPostalCode | The contact mailing postal code | 
> | stateProvinceName | MailingState | The contact state province name | 
> | countryName | MailingCountry | The country name of the contact | 
> | geoLatitude | MailingLatitude | The geo-latitude code of the contact | 
> | geoLongitude | MailingLongitude | The geo-longitude code of the contact  | 
> | geoAccuracy | MailingGeocodeAccuracy | The geo-code accurate location of the contact  | 
> | contactPointType | ContactPointEmail |  contactPointType set as "ContactPointEmail" | 
> | id | null | The contactpoint id set as null | 
> | activeFromDate | now() |  The date from which the contactpoint is active - Set as current date | 
> | emailAddress | Email |  The email address of the contact  | 
> | contactPointType | ContactPointPhone | contactPointType - set as "ContactPointPhone" | 
> | contactPointType | ContactId | The contactpoint id - set as null | 
> | activeFromDate | now() |  The date from which the contactpoint is active - Set as current date | 
> | telephoneNumber | Phone | The phone number of the contact | 
> | externalIds.id | id |  Id field is hardcoded as empty string | 
> | externalIds.externalId | Global_Individual_Id__c |  The identifier of the contact in MDM system | 
> | externalIds.externalIdType | MDM | The externalId Type set as "MDM" | 
> | externalIds.statusLastChangedDate | LastModifiedDate |  Last modified date to "yyyy-MM-dd'T'HH:mm:ssz" | 
> | externalIds.status | VALID | The externalId status is set as VALID | 
> | auditInfo.createdDate |  CreatedDate | Timestamp of when the contact was created  | 
> | auditInfo.createdBy |  CreatedBy.Name | Identifies the system or user which created the contact | 
> | auditInfo.updatedDate |  LastModifiedDate | Timestamp of when the contact was last updated | 
> | auditInfoupdatedBy |  LastModifiedBy.Name | Identifies the system or user which last updated the contact | 
> | auditInfo.isDeleted |  IsDeleted | Indicates whether or not the contact has been soft-deleted | 


# update-contact-request-for-sf
Salesforce  Contact update  mapping

## Mapping Tables

Maps CIM Individual format to Salesforce Contact Object 

> | Salesforce  Contact | CIM | Description | 
> | ---- |---- |---- |
> | Id | contactId | The identifier of the contact in Salesforce | 
> | Salutation | party.salutation | The salutation of the contact | 
> | FirstName | party.firstName | The First Name of the contact | 
> | lastName | party.LastName | The Last Name of the contact | 
> | BirthDate | party.birthDate | The birth date of the contact | 
> | Global_Individual_Id__c | externalIds.externalId | The identifier of the contact in MDM system | 
> | MailingStreet | party.contactPointAddress.addressLine1 | The mailing Address of the contact | 
> | MailingCity | party.contactPointAddress.cityName | The mailing city of the contact | 
> | MailingPostalCode | party.contactPointAddress.postalCodeText | The mailing postal code of the contact | 
> | MailingState | party.contactPointAddress.stateProvinceName | The contact mailing state | 
> | MailingCountry | party.contactPointAddress.countryName | The contact mailing country | 
> | MailingLatitude | party.contactPointAddress.geoLatitude | The contact geo lattitude location | 
> | MailingLongitude | party.contactPointAddress.geoLongitude | The contact geo logitude location | 
> | Email | party.ContactPointEmail.emailAddress | The contact email | 
> | Phone | party.ContactPointPhone.telephoneNumber | The contact phone Number | 


# contact-create-response-headers

# create-contact-request
Salesforce  Contact create  mapping

## Mapping Tables

Maps CIM Individual format to Salesforce Contact Object 

> | Salesforce  Contact | CIM | Description | 
> | ---- |---- |---- |
> | Salutation | party.salutation | The salutation of the contact | 
> | FirstName | party.firstName | The First Name of the contact | 
> | lastName | party.LastName | The Last Name of the contact | 
> | BirthDate | party.birthDate | The birth date of the contact | 
> | Global_Individual_Id__c | externalIds.externalId | The identifier of the contact in MDM system | 
> | MailingStreet | party.contactPointAddress.addressLine1 | The mailing Address of the contact | 
> | MailingCity | party.contactPointAddress.cityName | The mailing city of the contact | 
> | MailingPostalCode | party.contactPointAddress.postalCodeText | The mailing postal code of the contact | 
> | MailingState | party.contactPointAddress.stateProvinceName | The contact mailing state | 
> | MailingCountry | party.contactPointAddress.countryName | The contact mailing country | 
> | MailingLatitude | party.contactPointAddress.geoLatitude | The contact geo lattitude location | 
> | MailingLongitude | party.contactPointAddress.geoLongitude | The contact geo logitude location | 
> | Email | party.ContactPointEmail.emailAddress | The contact email | 
> | Phone | party.ContactPointPhone.telephoneNumber | The contact phone Number | 


# map-contact-points-for-contact

# ping-response-payload

