import 'package:flutter/material.dart';
import '../models/measurement.dart';

class MeasurementCard extends StatelessWidget {
  final Measurement measurement;

  const MeasurementCard({Key? key, required this.measurement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${measurement.date.year}-${measurement.date.month.toString().padLeft(2, '0')}-${measurement.date.day.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMeasurement('Height', '${measurement.height}cm',
                    measurement.heightStatus),
                _buildMeasurement('Weight', '${measurement.weight}kg',
                    measurement.weightStatus),
                _buildMeasurement('BMI', measurement.bmi.toStringAsFixed(1),
                    measurement.bmiStatus),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurement(String label, String value, String status) {
    return Column(
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _getStatusColor(status),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'insufficient':
        return Colors.orange;
      case 'good':
        return Colors.green;
      case 'over-expected':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
