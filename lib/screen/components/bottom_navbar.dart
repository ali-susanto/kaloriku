import 'package:flutter/material.dart';
import 'package:kaloriku/screen/home/home_screen.dart';
import 'package:kaloriku/screen/profile/profile_screen.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.blue,
      child: Container(
        // height: 50,
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          //color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -4),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.5))
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const HomeScreen()));
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calculate_outlined,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.public, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const ProfileScreen()));
                  },
                  icon: const Icon(Icons.person_rounded, color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
