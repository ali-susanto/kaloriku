import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kaloriku/constants.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final int index;
  var onTap;

  @override
  Widget build(BuildContext context) {
    final page = ['/home', '/scan', '/profile'];
    return ConvexAppBar(
      backgroundColor: kSecondaryBlue,
      style: TabStyle.fixedCircle,
      initialActiveIndex: index,
      items: const [
        TabItem(icon: Icons.home),
        TabItem(icon: Icons.calculate_outlined),
        TabItem(icon: Icons.camera_alt, title: 'Scan'),
        TabItem(icon: Icons.public),
        TabItem(icon: Icons.person)
      ],
      onTap: onTap,
    );
  }
}
