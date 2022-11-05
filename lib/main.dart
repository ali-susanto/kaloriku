import 'package:camera/camera.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kaloriku/screen/calculator/calculator_screen.dart';
import 'package:kaloriku/screen/detection/detection_screen.dart';
import 'package:kaloriku/screen/home/home_screen.dart';
import 'package:kaloriku/screen/profile/profile_screen.dart';
import 'package:kaloriku/screen/tips/tips_screen.dart';
import 'package:kaloriku/screen/tips/tips_view_model.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

late List<CameraDescription> camera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TipsViewModel())],
      child: const MyApp(),
    ),
  );
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
      home: const MainBody(),
      // initialRoute: '/calculator',
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int selectedPage = 0;
  final _page = const [
    HomeScreen(),
    CalculatorScreen(),
    DetectionScreen(),
    TipsScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _page[selectedPage],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: kSecondaryBlue,
          style: TabStyle.fixedCircle,
          initialActiveIndex: selectedPage,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.calculate_outlined, title: 'BMI'),
            TabItem(icon: Icons.camera_alt, title: 'Scan'),
            TabItem(icon: Icons.public, title: 'Tips'),
            TabItem(icon: Icons.person, title: 'Profile')
          ],
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
