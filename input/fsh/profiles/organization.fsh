Profile: UrxOrganization
Parent: Organization
Description: "Example of a general organization based on US Core and NDH"
* active 1..1
* type 1..* MS // e.g. government for things like board of pharmacy
* name 1..1 MS
* alias MS // align with NDH
// address is optional, we'll put pharmacy addresses in the healthcare service

Profile: UrxOrganizationPharmacy
Parent: UrxOrganization
Description: "Representing a pharmacy organization"
* identifier 1..* MS // add slices for NPI, NCPDPID, DEA

Instance: BigPharmacyChain
InstanceOf: UrxOrganizationPharmacy
Description: "A large pharmacy chain"
* identifier[+]
  * system = $npi
  * value = "1234567890"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#pharmacy // align with hl7 terminology
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#prov // align with cms NPD/NDH
* type[+] = http://terminology.hl7.org/CodeSystem/NCPDPPharmacyType#R "Retail" // align with CRTPBC (its rtpbc-pharmacy-type value set draws from this code system)
* name = "Big Pharmacy Chain"

Instance: BigPharmacyChainStore123
InstanceOf: UrxHealthcareServicePharmacy
Description: "A specific store of a large pharmacy chain"
* active = true
* providedBy = Reference(BigPharmacyChain)
* category = http://terminology.hl7.org/CodeSystem/ndh-healthcare-service-category#pharm
* specialty = http://nucc.org/provider-taxonomy#3336C0003X
* location = Reference(BigPharmacyChainStore123Location)

Instance: BigPharmacyChainStore123Location
InstanceOf: Location
Description: "The specific location of a store of a large pharmacy chain"
* name = "Big Pharmacy Chain Store 123"
* address
  * line = "123 Main St"
  * city = "Orlando"
  * state = "FL"
  * postalCode = "32801"

Instance: FloridaBoardOfPharmacy
InstanceOf: UrxOrganization
Description: "Florida board of pharmacy"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt
* name = "Florida Board of Pharmacy"

Instance: BoardOfPharmacySpecialties
InstanceOf: UrxOrganization
Description: "Board of Pharmacy Specialties"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#bus
* name = "Board of Pharmacy Specialties"

Instance: UniversityOfFloridaCollegeOfPharmacy
InstanceOf: UrxOrganization
Description: "University of Florida College of Pharmacy"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#edu
* name = "University of Florida College of Pharmacy"

Profile: UrxHealthcareService
Parent: HealthcareService
Description: "Example of a general healthcare service based on US Core and NDH"
* active 1..1
* providedBy 0..1 MS
* category 1..* MS // align with NDH
* specialty 0..* MS // align with NDH
* location 0..* MS // additional constraint that captures the location of the pharmacy service

Profile: UrxHealthcareServicePharmacy
Parent: UrxHealthcareService
Description: "Example of a pharmacy healthcare service based on US Core and NDH"
* providedBy 1..1 MS
* category 1..* MS // align with NDH
* specialty 1..* MS // align with NDH
* location 1..* MS // additional constraint that captures the location of the pharmacy service
