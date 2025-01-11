import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/progress_bar.dart';
import 'package:sishu_sewa/models/measurement.dart';
import 'package:sishu_sewa/pages/kid_profile.dart';

class ChildCard extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String birthWeight;
  final int ageInDays;
  final String upcomingVaccine;
  final int totalImmunizations;
  final int completedImmunizations;
  final List<Color> gradientColors;

  const ChildCard({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.birthWeight,
    required this.ageInDays,
    required this.upcomingVaccine,
    required this.totalImmunizations,
    required this.completedImmunizations,
    required this.gradientColors,
  });

  _handleOnDotClick(int index) {
    // Show details of the immunization
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigate to child details
          ChildMeasurement child = ChildMeasurement(
            name: name,
            imageUrl: 'https://example.com/image.jpg',
            birthDate: DateTime(2015, 5, 15),
            gender: gender,
            measurements: [],
            lastUpdated: DateTime.now(),
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return KidProfileScreen(child: child);
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Edit child details
                    },
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                age,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Gender: $gender',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Birth Weight: $birthWeight',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ProgressBar(
                  milestoneDays: const [0, 42, 70, 98, 270, 365, 450],
                  currentAgeInDays: ageInDays,
                  onDotClick: _handleOnDotClick,
                  milestones: const [
                    "At birth",
                    "6 weeks",
                    "10 weeks",
                    "14 weeks",
                    "9 months",
                    "12 months",
                    "15 months"
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Upcoming Vaccine: $upcomingVaccine',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_right_rounded,
                        color: Colors.white),
                    onPressed: () {
                      // Add vaccine
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
