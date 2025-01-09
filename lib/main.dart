import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/navbar.dart';
import 'package:sishu_sewa/pages/add_child.dart';
import 'package:sishu_sewa/pages/home.dart';
import 'package:sishu_sewa/pages/kids.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sisu Sewa',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF3E3E3E), // Background color
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness:
              Brightness.dark, // Dark mode ensures white text by default
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(context),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          KidsScreen(),
          // Add other pages here
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

Widget floatingActionButton(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF4EC1FF), Color(0xFF2D8DFF)], // Gradient colors
        begin: Alignment.topLeft, // Start of the gradient
        end: Alignment.bottomRight, // End of the gradient
      ),
      shape: BoxShape.circle, // To maintain the circular shape
    ),
    width: 60,
    height: 60,
    child: FloatingActionButton(
      onPressed: () {
        // Action for the FAB
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddChildPage()),
        );
      },
      backgroundColor: Colors.transparent, // Make the background transparent
      shape: const CircleBorder(),
      elevation: 10, // Optional: Add shadow for a lifted effect
      child: const Icon(
        Icons.add,
        size: 40, // Increase the size of the icon
      ),
    ),
  );
}
