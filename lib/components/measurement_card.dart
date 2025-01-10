import 'package:flutter/material.dart';
import '../models/measurement.dart';

class MeasurementCard extends StatelessWidget {
  final Measurement measurement;

  const MeasurementCard({Key? key, required this.measurement}) : super(key: key);

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
                  measurement.date.toString().split(' ')[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Good',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMeasurement('HT', '${measurement.height}cm', 'Insufficient'),
                _buildMeasurement('WT', '${measurement.weight}kg', 'Insufficient'),
                _buildMeasurement('BMI', measurement.bmi.toString(), 'Normal'),
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
            color: status == 'Insufficient'
                ? Colors.orange
                : status == 'Normal'
                    ? Colors.green
                    : Colors.blue,
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
}