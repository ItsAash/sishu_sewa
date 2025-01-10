import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GrowthChart extends StatelessWidget {
  const GrowthChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GrowthData> chartData = [
      GrowthData(DateTime(2021, 1, 2), 49, 5),
      GrowthData(DateTime(2021, 1, 5), 50, 4.5),
      GrowthData(DateTime(2021, 1, 10), 55, 5),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Growth Chart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: 'Body Weight',
                items: const [
                  DropdownMenuItem(
                    value: 'Body Weight',
                    child: Text('Body Weight'),
                  ),
                  DropdownMenuItem(
                    value: 'Height',
                    child: Text('Height'),
                  ),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                title: AxisTitle(text: 'Date'),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Measurements'),
                majorGridLines: const MajorGridLines(width: 0.5),
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<GrowthData, DateTime>>[
                LineSeries<GrowthData, DateTime>(
                  name: 'Height (cm)',
                  dataSource: chartData,
                  xValueMapper: (GrowthData data, _) => data.date,
                  yValueMapper: (GrowthData data, _) => data.height,
                  markerSettings: const MarkerSettings(isVisible: true),
                  color: Colors.blue,
                ),
                LineSeries<GrowthData, DateTime>(
                  name: 'Weight (kg)',
                  dataSource: chartData,
                  xValueMapper: (GrowthData data, _) => data.date,
                  yValueMapper: (GrowthData data, _) => data.weight,
                  markerSettings: const MarkerSettings(isVisible: true),
                  color: Colors.green,
                ),
              ],
            ),
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
}

class GrowthData {
  final DateTime date;
  final double height;
  final double weight;

  GrowthData(this.date, this.height, this.weight);
}
