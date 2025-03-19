// Extension: MedicationDevice - separate for R4 and R5 due to CodeableReference
// StrengthSubstance separate for R4 and R5 due to strength[x] element
// StrengthType separate for R4 and R5 due to strength[x] element
Extension: PackageType
Id: package-type
Title: "Package type"
Description: "This extension applies to Medication and expresses the type of the container for the product (e.g. bottle, unit-dose blister, pre-filled pen)."
Context: Medication
* ^url = "http://hl7.eu/fhir/StructureDefinition/package-type"
* value[x] only CodeableConcept
* valueCodeableConcept from $eHDSIPackage (example)	
* valueCodeableConcept ^short = "Type of container, e.g pre-filled syringe, unit-dose blister, sachet, etc."
// TODO: When IHE PR is approved, move to R4 only
Extension: OffLabelUse
Id:        ihe-ext-medicationrequest-offlabeluse
Title:     "MedicationRequest - Off-label use"
Description: "Indicates that the order placer has knowingly prescribed the medication for an indication, age group, dosage, or route of administration that is not approved by the regulatory agencies and is not mentioned in the prescribing information for the product."
* ^context[+].type = #element
* ^context[=].expression = "MedicationRequest"
* ^context[+].type = #element
* ^context[=].expression = "MedicationStatement"
* ^url = "http://profiles.ihe.net/PHARM/ihe.pharm.mpd/StructureDefinition/ihe-ext-medicationrequest-offlabeluse"
* extension contains
    true 1..1 and
    reason 0..*
* extension[true].value[x] only boolean
* extension[true] ^short = "Indicates off-label use. Must be 'true' when .reason is provided."
* extension[reason].value[x] only CodeableConcept
* extension[reason] ^short = "Reason or related clarification for off-label use."