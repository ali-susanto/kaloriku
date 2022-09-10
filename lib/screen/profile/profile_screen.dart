import 'package:flutter/material.dart';
import 'package:kaloriku/screen/components/bottom_navbar.dart';
import 'package:kaloriku/screen/components/scan_fab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [Text('Profile')],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ScanButton(),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
