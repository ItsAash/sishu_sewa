import 'package:flutter/material.dart';
import 'package:sishu_sewa/components/navbar.dart';
import 'package:sishu_sewa/models/measurement.dart';
import 'package:sishu_sewa/pages/add_child.dart';
import 'package:sishu_sewa/pages/home.dart';
import 'package:sishu_sewa/pages/kids.dart';
import 'package:sishu_sewa/pages/profile_screen.dart';
import 'package:sishu_sewa/pages/setting_screen.dart';
import 'package:sishu_sewa/pages/kid_profile.dart';

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
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const KidsScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

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
        children: _screens,
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
        colors: [Color(0xFF4EC1FF), Color(0xFF2D8DFF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shape: BoxShape.circle,
    ),
    width: 60,
    height: 60,
    child: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddChildPage()),
        );
      },
      backgroundColor: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 10,
      child: const Icon(
        Icons.add,
        size: 40,
      ),
    ),
  );
}
