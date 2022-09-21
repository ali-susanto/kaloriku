import 'package:flutter/material.dart';
import '../../components/bottom_navbar.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({Key? key}) : super(key: key);

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('data'),
      bottomNavigationBar: BottomNavbar(index: 2, onTap: () {}),
    );
  }
}
