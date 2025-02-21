import 'package:flutter/material.dart';
import 'screens/landing_page.dart'; // Or your starting page

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // <--- Ensure you have MaterialApp here as the root
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(), // Or your initial page
    );
  }
}