import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _page = ['/home', '/calculator', '/scan', '/tips', '/profile'];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('129 Calories'),
                        Text('129 Calories'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('129 Calories')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const ScanButton(),
      // bottomNavigationBar: BottomNavbar(
      //   index: 0,
      //   onTap: (int index) {
      //     setState(() {
      //       _selectedPage = index;
      //     });
      //   },
      // ),
    );
  }
}
