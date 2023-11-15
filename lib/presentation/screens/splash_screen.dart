import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            height: 600,
            width: 600,
            child: AnimatedSplashScreen(
              splash: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset("assets/images/login2.png")),
                  const SizedBox(
                    height: 64.0,
                    width: 200,
                  ),
                  const Text(
                    "Your Lawyer App :)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                ],
              ),
              nextScreen: const OnBoardingScreen(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.black,
              splashIconSize: 550,
            ),
          ),
        ),
      ),
    );
  }
}
