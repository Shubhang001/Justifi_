import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../widgets/nav_indicator.dart';
import 'mianpage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentintro = 0;
  List images = [
    'assets/images/ob1.png',
    'assets/images/ob2.png',
    'assets/images/ob3.png'
  ];
  List titles = [
    'Find advocates near you',
    'Communicate directly with advocates',
    'Float cases to hire advocates'
  ];
  List description = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/onboarding.png')),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Text(
                  'Welcome to Justifi!',
                  style: konboardingTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19),
                child: Text(
                  'Lorem ipsum dolor sit',
                  style: konboardingSubtitleTitle,
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          height: 400,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  images[currentintro],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Text(
                  titles[currentintro],
                  textAlign: TextAlign.center,
                  style: kobTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Text(
                  description[currentintro],
                  style: kobDescription,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const MainPage()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'Skip',
                        style: kobButton,
                      )),
                  NavIndicator(currentintro: currentintro),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          if (currentintro < 2) {
                            currentintro++;
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>  MainPage()),
                                (Route<dynamic> route) => false);
                          }
                        });
                      },
                      child: Text(
                        'Next',
                        style: kobButton,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

