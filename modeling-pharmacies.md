# Modeling Pharmacies in the United States
Representing a pharmacy in FHIR appears to be fragmented. The goal of this page is to reconcile how
some of the existing FHIR IGs (e.g. NDH, CARIN, DaVinci) model pharmacies and determine the best path
forward.

## Existing FHIR IGs that have an opinion
- [US Core 6.1.0](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-organization.html)
- [National Directory of Healthcare Providers & Services (NDH) Implementation Guide](https://build.fhir.org/ig/HL7/fhir-us-ndh/en/)
- [Consumer Real-Time Pharmacy Benefit Check FHIR IG](https://build.fhir.org/ig/HL7/carin-rtpbc/en/)
- [Da Vinci PDex Plan Net](https://build.fhir.org/ig/HL7/davinci-pdex-plan-net/en/)
- [US Prescription Drug Monitoring Program (PDMP)](https://build.fhir.org/ig/HL7/fhir-pdmp/index.html)
- [PACIO Transitions of Care Implementation Guide](https://build.fhir.org/ig/HL7/fhir-transitions-of-care-ig/)
- [AU Base Implementation Guide](https://build.fhir.org/ig/hl7au/au-fhir-base/en/)

### Reconciliation
Representing a pharmacy as an organization, healthcareService, etc

#### Organization
|Field|URx|US Core|NDH|CRTPBC|DaVinci PDex PlanNet|PDMP|PACIO|AU|Cardinality|Description/Comments|
|--|--|--|--|--|--|--|--|--|--|--|
|identifier|1..*|no|no|1..*|no|1..*|-|-|-|slices for NPI, CLIA, NIAC, TID, PIN, NCPDP, DEA|
|meta.lastUpdated|1..1|no|1..1|no|no|no|-|-|-|-|-|
|type|1..*|no|1..*|1..1|1..* MS|-|-|0..* MS|-|-|-|-|
|type binding|align with NDH|[org type](http://hl7.org/fhir/R4/valueset-organization-type.html)|[ndh org type](https://build.fhir.org/ig/HL7/fhir-us-ndh/en/ValueSet-OrgTypeVS.html)|[pharmacy type](https://build.fhir.org/ig/HL7/carin-rtpbc/en/ValueSet-rtpbc-pharmacy-type.html)|-|-||[AU HealthOrgRoleType Snomed for pharmacy](https://www.healthterminologies.gov.au/integration/R4/fhir/ValueSet/healthcare-organisation-role-type-1)|-|-|-|
|active|1..1|1..1|1..1|1..1|1..1|-|-|-|-|-|-|
|name|1..1|1..1|1..1|1..1|-|1..1|-|-|-|-|-|
|address|0..*|-|-|-|1..*|

#### HealthcareService
|Field|URx|US Core|NDH|CRTPBC|DaVinci PDex PlanNet|PDMP|PACIO|AU|Cardinality|Description/Comments|
|--|--|--|--|--|--|--|--|--|--|--|
|meta.lastUpdated|1..1|no|1..1|no|-|-|-|-|-|-|-|
|active|1..1|no|yes|no|
|providedBy (ref Org)|0..1 MS|no|0..1 MS|no|
|category|1..*|no|1..*|no|
|category VS|[NDH's service category](https://build.fhir.org/ig/HL7/fhir-us-ndh/en/ValueSet-NdhHealthcareServiceCategoryVS.html)|no|[NDH's service category](https://build.fhir.org/ig/HL7/fhir-us-ndh/en/ValueSet-NdhHealthcareServiceCategoryVS.html)|no|
|specialty|0..* MS|no|0..* MS|no|
|speciality VS|[NUCC's taxonomy](https://vsac.nlm.nih.gov/valueset/2.16.840.1.114222.4.11.1066/expansion)|no|[NUCC's taxonomy](https://vsac.nlm.nih.gov/valueset/2.16.840.1.114222.4.11.1066/expansion)|no|
|location|1..* MS|no|0..* MS|no|
|name|0..1 MS|no|0..1 MS|no|