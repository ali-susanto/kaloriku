import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaloriku/constants.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  Container(
                    height: size.width * 0.45,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(9)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/male.svg'),
                        const Text('Pria'),
                      ],
                    ),
                  ),
                  Container(
                    height: size.width * 0.45,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(9)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/female.svg'),
                        const Text('Wanita'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                    color: kGreyColor, borderRadius: BorderRadius.circular(9)),
                child: const Center(child: Text('Tinggi')),
              ),
              const SizedBox(
                height: 16,
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
                    child: const Center(child: Text('Pria')),
                  ),
                  Container(
                    height: size.width * 0.45,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(9)),
                    child: const Center(child: Text('Wanita')),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: kPrimaryBlue),
                      child: const Text('Hitung')))
            ],
          ),
        ),
      ),
    );
  }
}
