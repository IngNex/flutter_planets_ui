import 'package:flutter/material.dart';
import 'package:flutter_planets_ui/ui/screens/home/home_screen.dart';
import 'package:flutter_planets_ui/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Planets UI',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
