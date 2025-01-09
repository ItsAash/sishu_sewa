import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/child_card.dart';
import 'package:sishu_sewa/components/screen_nav.dart';
import 'package:sishu_sewa/components/welcome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onTap(int index) {
    print('Tapped on index $index');
  }

  @override
  Widget build(BuildContext context) {
    // Get screen height for layout calculations
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeComponent(
                name: "Ashish Neupane",
                imageUrl:
                    "https://media.licdn.com/dms/image/v2/D5603AQF7InSZOBQMpg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1674112007614?e=1741824000&v=beta&t=9I1tcswSbG2GVFYuLwBA5Mq8qlG3zOxdiMkMG5QJJUo"),
            Stack(children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13 / 2),
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
                child: const Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 80),
                  child: SizedBox(
                    child: const Column(
                      children: [
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
                            Color.fromRGBO(128, 159, 179, 1),
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
                            Color.fromRGBO(179, 128, 174, 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Center(child: ScreenNavigation()),
            ]),
          ],
        ),
      ),
    );
  }
}
