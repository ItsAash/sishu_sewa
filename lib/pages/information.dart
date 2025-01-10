import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  void _navigateToDetailPage(BuildContext context, String title, int imageIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationDetailScreen(
          title: title,
          imageIndex: imageIndex,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, Color titleColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: titleColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.arrow_forward, size: 20, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 3; i++)
                  GestureDetector(
                    onTap: () => _navigateToDetailPage(context, title, i),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/images/${title.toLowerCase()}_${i + 1}.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3D5C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInfoCard(context, 'Nutrition', Colors.orange),
              _buildInfoCard(context, 'Sleep', Colors.orange),
              _buildInfoCard(context, 'Hygiene', Colors.orange),
              _buildInfoCard(context, 'Vaccines', Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}

// Detail Screen
class InformationDetailScreen extends StatelessWidget {
  final String title;
  final int imageIndex;

  const InformationDetailScreen({
    Key? key,
    required this.title,
    required this.imageIndex,
  }) : super(key: key);

  String _getInformation() {
    // Add your detailed information for each category and image here
    final Map<String, List<String>> information = {
      'Nutrition': [
        'Balanced diet for infants includes breast milk or formula, and gradually introduced solid foods.',
        'Important nutrients for growing babies include proteins, vitamins, and minerals.',
        'Proper feeding schedule and portion sizes for different age groups.',
      ],
      'Sleep': [
        'Newborns need 14-17 hours of sleep per day.',
        'Establishing healthy sleep routines for babies.',
        'Signs of sleep problems and how to address them.',
      ],
      'Hygiene': [
        'Proper bathing techniques for infants.',
        'Daily cleaning and sanitization practices.',
        'Common hygiene-related concerns and solutions.',
      ],
      'Vaccines': [
        'Essential vaccinations for newborns and infants.',
        'Vaccination schedule and timing.',
        'Understanding vaccine safety and side effects.',
      ],
    };

    return information[title]?[imageIndex] ?? 'Information not available';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3D5C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          '$title Information',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/${title.toLowerCase()}_${imageIndex + 1}.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _getInformation(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}