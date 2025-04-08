import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xFF4E73DF); // biru elegan

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Mahasiswa Baru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primaryColor,
        brightness: Brightness.light,
      ),
      home: HomeScreen(),
    );
  }
}
