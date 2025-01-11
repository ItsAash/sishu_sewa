class Measurement {
  final DateTime date;
  final double height;
  final double weight;
  final double bmi;
  final String heightStatus;
  final String weightStatus;
  final String bmiStatus;

  Measurement({
    required this.date,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.heightStatus,
    required this.weightStatus,
    required this.bmiStatus,
  });
}

class ChildMeasurement {
  final String name;
  final String imageUrl;
  final DateTime birthDate;
  final String gender;
  final List<Measurement> measurements;

  ChildMeasurement({
    required this.name,
    required this.imageUrl,
    required this.birthDate,
    required this.gender,
    required this.measurements, required DateTime lastUpdated,
  });

  String get age {
    final now = DateTime.now();
    final difference = now.difference(birthDate);
    final years = difference.inDays ~/ 365;
    final months = (difference.inDays % 365) ~/ 30;
    final days = difference.inDays % 30;
    return '$years Years $months Months $days Days';
  }
}

