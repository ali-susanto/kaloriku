import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaloriku/components/bottom_navbar.dart';
import 'package:kaloriku/constants.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var _selectedPage = ['/scan', '/calculator'];
  bool isMale = true;
  double height = 180;
  int weight = 80;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
            backgroundColor: kWhiteColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'BMI Calculator',
              style: TextStyle(color: kBlackColor),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 13),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        height: size.width * 0.45,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: isMale
                                ? kSecondaryBlue
                                : kGreyColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.male,
                                size: 110,
                              ),
                              Spacer(),
                              Text(
                                'Pria',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        height: size.width * 0.45,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: isMale
                                ? kGreyColor.withOpacity(0.3)
                                : kSecondaryBlue,
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.female,
                                size: 110,
                              ),
                              Spacer(),
                              Text(
                                'Wanita',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  height: size.width * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: kGreyColor,
                      borderRadius: BorderRadius.circular(9)),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      children: [
                        const Text(
                          'Tinggi',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.round().toString(),
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              ' cm',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Spacer(),
                        Slider(
                            value: height,
                            min: 80,
                            max: 220,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            }),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.width * 0.45,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: BorderRadius.circular(9)),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          children: [
                            const Text('Berat',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            const Spacer(
                              flex: 2,
                            ),
                            Text(
                              weight.toString(),
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      icon: const Icon(Icons.remove)),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      icon: const Icon(Icons.add)),
                                )
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.width * 0.45,
                      width: size.width * 0.42,
                      decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: BorderRadius.circular(9)),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          children: [
                            const Text('Umur',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            const Spacer(
                              flex: 2,
                            ),
                            Text(
                              age.toString(),
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      icon: const Icon(Icons.remove)),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      icon: const Icon(Icons.add)),
                                )
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: SizedBox(
                                height: size.width * 0.5,
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(
                                    children: [
                                      Text(isMale ? 'Pria' : 'Wanita'),
                                      Text('${height.round()} cm'),
                                      Text(weight.toString()),
                                      Text(age.toString()),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 13),
                                  child: Center(
                                    child: SizedBox(
                                      width: size.width,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: kPrimaryBlue),
                                          child: const Text('Oke')),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(primary: kPrimaryBlue),
                        child: const Text('Hitung')))
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(
            index: 1,
            onTap: (index) {
              setState(() {
                _selectedPage = index;
              });
            }));
  }
}
