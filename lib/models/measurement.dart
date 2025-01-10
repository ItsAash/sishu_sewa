class Measurement {
  final DateTime date;
  final double height;
  final double weight;
  final double bmi;
  final String status;

  Measurement({
    required this.date,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.status,
  });
}

class ChildMeasurement {
  final String name;
  final String imageUrl;
  final DateTime birthDate;
  final String gender;
  final List<Measurement> measurements;
  final DateTime lastUpdated;

  ChildMeasurement({
    required this.name,
    required this.imageUrl,
    required this.birthDate,
    required this.gender,
    required this.measurements,
    required this.lastUpdated,
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
