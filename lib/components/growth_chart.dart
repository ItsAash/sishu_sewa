import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/measurement.dart';
import '../data/ideal_growth_data.dart';

class GrowthChart extends StatelessWidget {
  final List<Measurement> childData;
  final DateTime childBirthDate;
  final String childGender;

  const GrowthChart({
    Key? key,
    required this.childData,
    required this.childBirthDate,
    required this.childGender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Growth Chart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildChart(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Height'),
              Tab(text: 'Weight'),
            ],
            labelColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildChartForMeasurement('Height', (m) => m.height, 'cm'),
                _buildChartForMeasurement('Weight', (m) => m.weight, 'kg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartForMeasurement(String title, double Function(Measurement) getValue, String unit) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        title: AxisTitle(text: 'Age (months)'),
        minimum: 0,
        maximum: 60,
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: '$title ($unit)'),
      ),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        LineSeries<IdealGrowthData, int>(
          name: 'Ideal $title',
          dataSource: idealGrowthData,
          xValueMapper: (IdealGrowthData data, _) => data.ageInMonths,
          yValueMapper: (IdealGrowthData data, _) => childGender.toLowerCase() == 'male'
              ? (title == 'Height' ? data.heightBoys : data.weightBoys)
              : (title == 'Height' ? data.heightGirls : data.weightGirls),
          color: Colors.green,
        ),
        ScatterSeries<Measurement, int>(
          name: 'Actual $title',
          dataSource: childData,
          xValueMapper: (Measurement data, _) => data.date.difference(childBirthDate).inDays ~/ 30,
          yValueMapper: (Measurement data, _) => getValue(data),
          color: Colors.blue,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}

