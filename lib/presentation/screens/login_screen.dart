import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/screens/signup_screen.dart';
import 'package:jusitfi_admin/presentation/widgets/mobilenumberfield.dart';
import 'package:jusitfi_admin/presentation/widgets/text_with_line.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jusitfi_admin/utils/services/rest_apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/colors.dart';
import '../widgets/big_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool validate = false;
  TextEditingController mobileNumber = TextEditingController();
  String otp = "";
  int otpCount = 0;
  int receivedUserId = 0;
  int resendTime = 60;
  late Timer countdownTimer;

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
        resendTime = 60;
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');

  Future<void> registerUserPhoneId() async {
    try {
      var response = await loginUserWithPhone(mobileNumber.text);

      if (response != null && response['success'] == true) {
        final id = response['id'];
        if (id != null) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(response["message"]),
            ));
            setState(() {
              receivedUserId = id;
              otpCount++; // Increment otpCount here
            });
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Failed to send OTP"),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  void _storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<bool> checkValidation() async {
    setState(() {
      mobileNumber.text.isEmpty ||
              !isNumeric(mobileNumber.text) ||
              mobileNumber.text.length != 10
          ? validate = true
          : validate = false;
    });

    if (!validate) {
      if (otp != "") {
        try {
          var response = await verifyUserLogin(receivedUserId.toString(), otp);
          if (response['success'] == true) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(response["message"]),
              ));

              setState(() {
                validate = false;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ));
            }
          }
        } catch (e) {
          setState(() {
            validate = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString()),
          ));
        }
      }
    }
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              transform: Matrix4.translationValues(0.0, 15.0, 0.0),
              child: Image.asset(
                'assets/images/login_white.png',
                height: 200,
                width: 200,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 80, 60, 0),
                        child: Column(
                          children: [
                            MobileInputTextField(
                                validate: validate,
                                title: 'Enter Your Mobile Number',
                                txtController: mobileNumber),
                            SizedBox(
                              height: 50,
                              width: 220,
                              child: resendTime == 60
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            startTimer();
                                          });
                                        },
                                        child: const Text(
                                          'Send otp',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        debugPrint("second tap");
                                      },
                                      child: Column(
                                        children: [
                                          const Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'Send otp',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          resendTime > 0
                                              ? Text(
                                                  'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.yellow),
                                                )
                                              : const SizedBox(
                                                  height: 8,
                                                )
                                        ],
                                      ),
                                    ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter OTP',
                              style: ktextFieldMainTitle,
                            ),
                            OtpTextField(
                              textStyle: kotp,
                              fieldWidth: 30,
                              decoration: const InputDecoration(
                                  fillColor: Colors.white),
                              numberOfFields: 6,
                              showFieldAsBox: false,
                              onSubmit: (String verificationCode) {
                                setState(() {
                                  otp = verificationCode;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                mobileNumber.text.isEmpty ||
                                        !isNumeric(mobileNumber.text) ||
                                        mobileNumber.text.length != 10
                                    ? validate = true
                                    : validate = false;
                              });
                              if (!validate) {
                                if (otp != "") {
                                  try {
                                    var response = await verifyUserLogin(
                                        receivedUserId.toString(), otp);
                                    if (response['success'] == true) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(response["message"]),
                                        ));
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage(),
                                            ),
                                            ((route) => false));
                                      }
                                    } else {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(response["message"]),
                                        ));
                                      }
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(e.toString()),
                                    ));
                                  }
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: kmainButtonColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Login',
                                style: kpageTitle,
                              )),
                            ),
                          )),
                      const TextWithLine(
                        label: 'New User',
                        height: 1,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(60, 20, 60, 13),
                              child: CustomButton(
                                removescreens: false,
                                nextPage: const SignupScreen(),
                                buttonColor: kbuttonColor,
                                text: 'Sign Up',
                                width: 150,
                                height: 40,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
