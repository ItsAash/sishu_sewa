import 'package:flutter/material.dart';
import '../components/measurement_card.dart';
import '../components/growth_chart.dart';
import '../models/measurement.dart';
import 'update_data_screen.dart';

class MeasurementScreen extends StatefulWidget {
  final ChildMeasurement child;

  const MeasurementScreen({Key? key, required this.child}) : super(key: key);

  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  late ChildMeasurement _child;

  @override
  void initState() {
    super.initState();
    _child = widget.child;
  }

  void _updateMeasurement(Measurement newMeasurement) {
    setState(() {
      _child.measurements.add(newMeasurement);
      _child.measurements.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void _showGrowthChart() {
    if (_child.measurements.isNotEmpty) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => GrowthChart(
          childData: _child.measurements,
          childBirthDate: _child.birthDate,
          childGender: _child.gender,

        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No measurement data available')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final latestMeasurement = _child.measurements.isNotEmpty ? _child.measurements.first : null;

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
                    backgroundImage: NetworkImage(_child.imageUrl),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _child.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _child.age,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    '${_child.birthDate.toString().split(' ')[0]} • ${_child.gender}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateDataScreen(
                            child: _child,
                            onUpdate: _updateMeasurement,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Update Data'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: _showGrowthChart,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('Growth Chart'),
                  ),
                ],
              ),
            ),
            if (latestMeasurement != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMeasurementTile('Height', '${latestMeasurement.height}', 'cm'),
                    _buildMeasurementTile('Weight', '${latestMeasurement.weight}', 'kg'),
                    _buildMeasurementTile('BMI', '${latestMeasurement.bmi.toStringAsFixed(1)}', ''),
                  ],
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('No measurement data available'),
              ),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _child.measurements.length,
              itemBuilder: (context, index) {
                return MeasurementCard(
                  measurement: _child.measurements[index],
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

