import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/child_card.dart';
import 'package:sishu_sewa/pages/add_child.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF255F81), // Start color
          Color(0xFF08141B), // End color
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      height: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.3,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ChildCard(
                    name: 'Brandon White',
                    gender: "Male",
                    age: '8 weeks 6 days',
                    ageInDays: 62,
                    birthWeight: '2.2kg',
                    totalImmunizations: 7,
                    completedImmunizations: 2,
                    upcomingVaccine: 'Polio on January 5',
                    gradientColors: [
                      Color.fromRGBO(5, 43, 59, 1),
                      Color.fromRGBO(128, 159, 179, 1)
                    ],
                  ),
                  SizedBox(height: 16),
                  ChildCard(
                    name: 'Sophie White',
                    gender: "Female",
                    age: '8 months 2 weeks',
                    ageInDays: 254,
                    birthWeight: '1.9kg',
                    totalImmunizations: 7,
                    completedImmunizations: 4,
                    upcomingVaccine: 'JE on January 5',
                    gradientColors: [
                      Color.fromRGBO(59, 32, 56, 1),
                      Color.fromRGBO(179, 128, 174, 1)
                    ],
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                // Add new child
                // Navigate to the app child page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddChildPage()),
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    ));
  }
}
