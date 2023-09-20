import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/chat_page.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/login_screen.dart';
import 'package:jusitfi_admin/presentation/screens/more_page.dart';
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
  List description = ['', '', ''];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: AlignmentDirectional.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 280,
                  width: 280,
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/justify_logo.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    'Welcome to Justify Spark!',
                    style: konboardingTitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    'Matching advocates with the right clients,effortlessly',
                    style: konboardingSubtitleTitle,
                    textScaleFactor: 0.75,
                  ),
                )
              ],
            ),
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
                            MaterialPageRoute(
                                builder: (context) => const MainPage()),
                            (Route<dynamic> route) => false);

                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const LoginScreen()),
                        // );
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
                                    builder: (context) => const LoginScreen()),
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
