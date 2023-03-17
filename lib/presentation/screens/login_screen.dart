import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Text('Log In'),
                const Icon(Icons.person_2_outlined)
              ],
            ),
            Container(
                transform: Matrix4.translationValues(0.0, 15.0, 0.0),
                child: Image.asset('assets/images/login.png')),
            Expanded(
                child: ListView(children: [
              Stack(children: [
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(200.0),
                        topLeft: Radius.circular(200.0)),
                    color: Colors.black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Enter your mobile number',
                      style: TextStyle(color: Colors.white),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.red),
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                    ),
                    const Text(
                      'Enter Otp',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ]),
            ]))
          ],
        ),
      ),
    );
  }
}
