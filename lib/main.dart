import 'package:flutter/material.dart';
import 'package:kaloriku/screen/detection/detection_screen.dart';
import 'package:kaloriku/screen/home/home_screen.dart';
import 'package:kaloriku/screen/profile/profile_screen.dart';

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
        '/profile': (context) => const ProfileScreen(),
        '/scan': (context) => const DetectionScreen()
      },
      initialRoute: '/home',
    );
  }
}
