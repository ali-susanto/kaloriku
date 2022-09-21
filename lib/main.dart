import 'package:flutter/material.dart';
import 'package:kaloriku/screen/calculator/calculator_screen.dart';
import 'package:kaloriku/screen/detection/detection_screen.dart';
import 'package:kaloriku/screen/home/home_screen.dart';
import 'package:kaloriku/screen/profile/profile_screen.dart';
import 'package:kaloriku/screen/tips/tips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaloriku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/calculator': (context) => const CalculatorScreen(),
        '/scan': (context) => const DetectionScreen(),
        '/tips': (context) => const TipsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      initialRoute: '/calculator',
    );
  }
}
