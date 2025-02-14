import 'package:flutter/material.dart';
import 'screens/landing_page.dart';  // Import LandingPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const LandingPage(),  // Set LandingPage as the initial screen
    );
  }
}
