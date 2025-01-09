import 'package:flutter/material.dart';
import 'package:sishu_sewa/pages/add_child.dart';
import 'package:sishu_sewa/pages/home.dart';

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
      home: HomeScreen(),
    );
  }
}
