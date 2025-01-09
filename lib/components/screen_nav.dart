import 'package:flutter/material.dart';

class ScreenNavigation extends StatelessWidget {
  const ScreenNavigation({
    super.key,
  });

  void onTap(int index) {
    // Handle navigation
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.87,
      height: MediaQuery.of(context).size.height * 0.13,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildButton(
              Icons.calendar_month,
              "Schedule",
              const LinearGradient(colors: [
                Color(0x8F255F81),
                Color.fromARGB(255, 84, 112, 128)
              ]),
              () => onTap(0)),
          _buildButton(
              Icons.vaccines,
              "Vaccines",
              const LinearGradient(
                  colors: [Color(0x8FF60094), Color(0x8FF60094)]),
              () => onTap(1)),
          _buildButton(
              Icons.import_contacts,
              "Articles",
              const LinearGradient(
                  colors: [Color(0x8FFF984E), Color(0x8FFF984E)]),
              () => onTap(2)),
          _buildButton(
              Icons.info,
              "Information",
              const LinearGradient(colors: [
                Color(0x8F11BDB5),
                Color.fromARGB(143, 90, 151, 148)
              ]),
              () => onTap(3)),
        ],
      ),
    );
  }
}

Widget _buildButton(
    IconData icon, String label, LinearGradient gradient, VoidCallback onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Wrap only the icon container with InkWell for tap animation
      Material(
        color: Colors.transparent, // Makes sure the background is transparent
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap, // Handle tap action
          borderRadius:
              BorderRadius.circular(15), // Ensure the ripple effect is clipped
          splashColor:
              Colors.white.withOpacity(0.4), // Optional: Custom splash color
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(15),
            ),
            padding:
                const EdgeInsets.all(10), // Adjust the padding to fit the icon
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const SizedBox(height: 5),
      // Text is unaffected by the tap animation
      Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
