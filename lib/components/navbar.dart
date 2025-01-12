import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF262626),
      elevation: 10,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side items
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.child_care, "Kids", 1),
            // Empty space for FloatingActionButton
            const SizedBox(width: 30), // Gap for FAB
            // Right side items
            _buildNavItem(Icons.settings, "Settings", 2),
            _buildNavItem(Icons.person, "Profile", 3),
          ],
        ),
      ),
    );
  }

  // Helper method to build a navigation item
  Widget _buildNavItem(IconData icon, String label, int index) {
    return ElevatedButton(
      onPressed: () {
        onTap(index);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // FloatingActionButton centered in BottomAppBar
}
