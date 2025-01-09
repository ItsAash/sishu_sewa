class Vaccine {
  final String fullName;
  final String shortName;
  final String type; // 'injection' or 'oral'
  final String description;

  Vaccine({
    required this.fullName,
    required this.shortName,
    required this.type,
    required this.description,
  });
}

class VaccineTimelineData {
  final String week;
  final List<Vaccine> vaccines;

  VaccineTimelineData({
    required this.week,
    required this.vaccines,
  });
}

final List<VaccineTimelineData> whoVaccineRoutineSchedule = [
  VaccineTimelineData(
    week: "0 week",
    vaccines: [
      Vaccine(
        fullName: "Bacillus Calmette Guerin",
        shortName: "BCG",
        type: "injection",
        description: "For Tuberculosis",
      ),
      Vaccine(
        fullName: "Hepatitis B",
        shortName: "Hep B1",
        type: "injection",
        description: "For Hepatitis B",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV0",
        type: "oral",
        description: "For Polio",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "6 weeks",
    vaccines: [
      Vaccine(
        fullName: "Pentavalent",
        shortName: "Penta1",
        type: "injection",
        description: "For Diphtheria, Pertussis, Tetanus, Hepatitis B",
      ),
      Vaccine(
        fullName: "Rotarix",
        shortName: "RV1",
        type: "oral",
        description: "For Rotavirus",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV1",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Pneumococcal Conjugate Vaccine",
        shortName: "PCV1",
        type: "injection",
        description: "For Pneumococcal disease",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "10 weeks",
    vaccines: [
      Vaccine(
        fullName: "Pentavalent",
        shortName: "Penta2",
        type: "injection",
        description: "For Diphtheria, Pertussis, Tetanus, Hepatitis B",
      ),
      Vaccine(
        fullName: "Rotarix",
        shortName: "RV2",
        type: "oral",
        description: "For Rotavirus",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV2",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Pneumococcal Conjugate Vaccine",
        shortName: "PCV2",
        type: "injection",
        description: "For Pneumococcal disease",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "14 weeks",
    vaccines: [
      Vaccine(
        fullName: "Pentavalent",
        shortName: "Penta3",
        type: "injection",
        description: "For Diphtheria, Pertussis, Tetanus, Hepatitis B",
      ),
      Vaccine(
        fullName: "Inactivated Polio Vaccine",
        shortName: "IPV1",
        type: "injection",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV3",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Pneumococcal Conjugate Vaccine",
        shortName: "PCV3",
        type: "injection",
        description: "For Pneumococcal disease",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "6 months",
    vaccines: [
      Vaccine(
        fullName: "Vitamin A Supplementation",
        shortName: "Vit A",
        type: "oral",
        description: "For immune system and vision health",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "9 months",
    vaccines: [
      Vaccine(
        fullName: "Measles - Rubella Vaccine",
        shortName: "MMR1",
        type: "injection",
        description: "For Measles, Mumps, and Rubella",
      ),
      Vaccine(
        fullName: "Yellow Fever Vaccine",
        shortName: "YF",
        type: "injection",
        description: "For Yellow Fever (where applicable)",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "18 months",
    vaccines: [
      Vaccine(
        fullName: "Measles - Rubella Vaccine",
        shortName: "MMR2",
        type: "injection",
        description: "For Measles, Mumps, and Rubella",
      ),
      Vaccine(
        fullName: "Diphtheria, Pertussis, Tetanus Booster",
        shortName: "DPT-Booster",
        type: "injection",
        description: "For Diphtheria, Pertussis, and Tetanus",
      ),
    ],
  ),
];

final List<VaccineTimelineData> nepalGovImmunizationSchedule = [
  VaccineTimelineData(
    week: "0 week",
    vaccines: [
      Vaccine(
        fullName: "Bacillus Calmette Guerin",
        shortName: "BCG",
        type: "injection",
        description: "For Tuberculosis",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV0",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Hepatitis B",
        shortName: "Hep B1",
        type: "injection",
        description: "For Hepatitis B",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "6 weeks",
    vaccines: [
      Vaccine(
        fullName:
            "Diphtheria, Pertussis, Tetanus + Hepatitis B + Haemophilus Influenzae Type B",
        shortName: "DPT-HepB-Hib1",
        type: "injection",
        description: "For Diphtheria, Pertussis, Tetanus, Hepatitis B, and Hib",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV1",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Pneumococcal Conjugate Vaccine",
        shortName: "PCV1",
        type: "injection",
        description: "For Pneumococcal disease",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "10 weeks",
    vaccines: [
      Vaccine(
        fullName:
            "Diphtheria, Pertussis, Tetanus + Hepatitis B + Haemophilus Influenzae Type B",
        shortName: "DPT-HepB-Hib2",
        type: "injection",
        description: "For Diphtheria, Pertussis, Tetanus, Hepatitis B, and Hib",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV2",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Pneumococcal Conjugate Vaccine",
        shortName: "PCV2",
        type: "injection",
        description: "For Pneumococcal disease",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "14 weeks",
    vaccines: [
      Vaccine(
        fullName:
            "Diphtheria, Pertussis, Tetanus + Hepatitis B + Haemophilus Influenzae Type B",
        shortName: "DPT-HepB-Hib3",
        type: "injection",
        description: "For Diphtheria, Pertussis, Tetanus, Hepatitis B, and Hib",
      ),
      Vaccine(
        fullName: "Oral Polio Vaccine",
        shortName: "OPV3",
        type: "oral",
        description: "For Polio",
      ),
      Vaccine(
        fullName: "Pneumococcal Conjugate Vaccine",
        shortName: "PCV3",
        type: "injection",
        description: "For Pneumococcal disease",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "9 months",
    vaccines: [
      Vaccine(
        fullName: "Measles - Rubella Vaccine",
        shortName: "MR1",
        type: "injection",
        description: "For Measles and Rubella",
      ),
      Vaccine(
        fullName: "Japanese Encephalitis Vaccine",
        shortName: "JE1",
        type: "injection",
        description: "For Japanese Encephalitis",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "12 months",
    vaccines: [
      Vaccine(
        fullName: "Vitamin A Supplementation",
        shortName: "VitA",
        type: "oral",
        description: "For immune system and vision health",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "15 months",
    vaccines: [
      Vaccine(
        fullName: "Measles - Rubella Vaccine",
        shortName: "MR2",
        type: "injection",
        description: "For Measles and Rubella",
      ),
      Vaccine(
        fullName: "Japanese Encephalitis Vaccine",
        shortName: "JE2",
        type: "injection",
        description: "For Japanese Encephalitis",
      ),
    ],
  ),
  VaccineTimelineData(
    week: "18 months",
    vaccines: [
      Vaccine(
        fullName: "Diphtheria, Pertussis, Tetanus Booster",
        shortName: "DPT-Booster1",
        type: "injection",
        description: "First booster for Diphtheria, Pertussis, and Tetanus",
      ),
    ],
  ),
];
