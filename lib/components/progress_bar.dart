import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final List<String> milestones; // List of milestone labels
  final int currentAgeInDays; // Current age of the child in days
  final List<int> milestoneDays; // Days for each milestone
  final Function(int index) onDotClick; // Callback when a dot is clicked

  const ProgressBar({
    super.key,
    required this.milestones,
    required this.currentAgeInDays,
    required this.milestoneDays,
    required this.onDotClick,
  });

  double _calculateProgressPercentage(
      int currentAgeInDays, List<int> milestoneDays) {
    double progress = 0.0;

    for (int i = 0; i < milestoneDays.length - 1; i++) {
      if (currentAgeInDays <= milestoneDays[i]) {
        break; // Stop if the current age is before the next milestone
      }

      if (currentAgeInDays < milestoneDays[i + 1]) {
        // Calculate progress within the current milestone interval
        double intervalProgress = (currentAgeInDays - milestoneDays[i]) /
            (milestoneDays[i + 1] - milestoneDays[i]);
        progress += intervalProgress / (milestoneDays.length - 1);
        break;
      }

      // Add full progress for completed intervals
      progress += 1.0 / (milestoneDays.length - 1);
    }

    return progress.clamp(0.0, 1.0); // Ensure the value is between 0 and 1
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth - 37;
        double progressPercentage = _calculateProgressPercentage(
            currentAgeInDays, milestoneDays); // Calculate progress

        return Stack(
          children: [
            // Full background line
            Container(
              height: 3,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              color: Colors.grey.shade300,
              width: width,
            ),

            // Active progress line
            Container(
              height: 3,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              width: (progressPercentage * 0.92) * width,
              color: Colors.green,
            ),

            // Dots and labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(milestones.length, (index) {
                double dotPosition =
                    (milestoneDays[index] / milestoneDays.last) * width;
                bool isCompleted = currentAgeInDays >= milestoneDays[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => onDotClick(index),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: isCompleted ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      milestones[index],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
