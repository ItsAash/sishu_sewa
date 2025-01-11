class IdealGrowthData {
  final int ageInMonths;
  final double heightBoys;
  final double weightBoys;
  final double heightGirls;
  final double weightGirls;

  IdealGrowthData(this.ageInMonths, this.heightBoys, this.weightBoys, this.heightGirls, this.weightGirls);
}

List<IdealGrowthData> idealGrowthData = [
  IdealGrowthData(0, 49.9, 3.3, 49.1, 3.2),
  IdealGrowthData(3, 61.4, 6.4, 60.2, 5.8),
  IdealGrowthData(6, 67.6, 7.9, 65.7, 7.3),
  IdealGrowthData(9, 72.3, 9.2, 70.1, 8.6),
  IdealGrowthData(12, 75.7, 10.2, 73.5, 9.5),
  IdealGrowthData(18, 82.3, 11.8, 80.0, 11.1),
  IdealGrowthData(24, 87.8, 13.0, 85.5, 12.4),
  IdealGrowthData(36, 96.1, 14.6, 93.9, 14.1),
  IdealGrowthData(48, 103.3, 16.7, 101.6, 16.1),
  IdealGrowthData(60, 110.0, 18.7, 108.4, 18.2),
];

