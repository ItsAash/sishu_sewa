import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/growth_chart.dart';
import 'package:sishu_sewa/components/measurement_card.dart';
import 'package:sishu_sewa/models/measurement.dart';

class KidProfileScreen extends StatelessWidget {
  final ChildMeasurement child;

  const KidProfileScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
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
                            child.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Rubik"),
                          ),
                          const SizedBox(height: 10),
                          Text(child.age,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${child.birthDate.toLocal()}'
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
                                Text(child.gender,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    )),
                              ]),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
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
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => const GrowthChart(),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              minimumSize: const Size(double.infinity, 48),
                            ),
                            child: const Text('Growth Chart'),
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
                      )
                    ],
                  )),
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width * 0.5 - 70,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://robohash.org/${child.name}"),
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
