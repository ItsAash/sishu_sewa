import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/growth_chart.dart';
import 'package:sishu_sewa/components/measurement_card.dart';
import 'package:sishu_sewa/models/measurement.dart';
import 'package:sishu_sewa/pages/update_data_screen.dart';

class KidProfileScreen extends StatefulWidget {
  final ChildMeasurement child;

  const KidProfileScreen({super.key, required this.child});

  @override
  State<KidProfileScreen> createState() => _KidProfileScreenState();
}

class _KidProfileScreenState extends State<KidProfileScreen> {
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
    final latestMeasurement =
        _child.measurements.isNotEmpty ? _child.measurements.first : null;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF255F81), // Start color
                    Color(0xFF08141B), // End color
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 90),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            _child.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik"),
                          ),
                          const SizedBox(height: 10),
                          Text(_child.age,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${_child.birthDate.toLocal()}'
                                        .split(' ')[0],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    )),
                                const SizedBox(width: 10),
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: null,
                                ),
                                const SizedBox(width: 10),
                                Text(_child.gender,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    )),
                              ]),
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
                            child: const Text(
                              'Update Data',
                              style: TextStyle(color: Colors.white),
                            ),
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
                          if (latestMeasurement != null)
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildMeasurementTile('Height',
                                      '${latestMeasurement.height}', 'cm'),
                                  _buildMeasurementTile('Weight',
                                      '${latestMeasurement.weight}', 'kg'),
                                  _buildMeasurementTile(
                                      'BMI',
                                      latestMeasurement.bmi.toStringAsFixed(1),
                                      ''),
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
                      )
                    ],
                  )),
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width * 0.5 - 70,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://robohash.org/${_child.name}"),
                radius: 70,
              ),
            ),
          ],
        )));
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
