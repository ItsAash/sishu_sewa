import 'package:flutter/material.dart';
import '../models/measurement.dart';
import '../components/measurement_card.dart';
import '../components/growth_chart.dart';

class MeasurementScreen extends StatelessWidget {
  final ChildMeasurement child;

  const MeasurementScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(child.imageUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    child.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    child.age,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    '${child.birthDate.toString().split(' ')[0]} • ${child.gender}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Update Data'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const GrowthChart(),
                      );
                    },
                    child: const Text('Growth Chart'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMeasurementTile('Height', '73', 'cm'),
                  _buildMeasurementTile('Weight', '12', 'kg'),
                  _buildMeasurementTile('BMI', '12', ''),
                ],
              ),
            ),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: child.measurements.length,
              itemBuilder: (context, index) {
                return MeasurementCard(
                  measurement: child.measurements[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementTile(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(unit),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
