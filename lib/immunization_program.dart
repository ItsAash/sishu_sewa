import 'package:sishu_sewa/vaccine.dart';

class ImmunizationProgram {
  final String name; // Name of the immunization program
  final String reference; // Reference text for the program
  final String link; // Link to the official program page
  final List<VaccineTimelineData> schedule; // Schedule of vaccines

  ImmunizationProgram(
      {required this.name,
      required this.reference,
      required this.link,
      required this.schedule});
}

final List<ImmunizationProgram> immunizationPrograms = [
  ImmunizationProgram(
      name: "WHO Routine Immunization",
      reference: "World Health Organization",
      link: "http://www.who.int/immunization/policy/immunization_tables/en/",
      schedule: whoVaccineRoutineSchedule),
  ImmunizationProgram(
      name: "Nepal Gov Immunization Program",
      reference: "According to Nepal Immunization Reference",
      link: "https://www.mohp.gov.np/eng/program/child-health-services",
      schedule: nepalGovImmunizationSchedule),
];
