import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/screens/signup_screen.dart';
import 'package:jusitfi_admin/presentation/widgets/mobilenumberfield.dart';
import 'package:jusitfi_admin/presentation/widgets/text_with_line.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jusitfi_admin/utils/dynamic/dynamic_values.dart';
import 'package:jusitfi_admin/utils/models/usermodel.dart';
import 'package:jusitfi_admin/utils/services/rest_apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/colors.dart';
import '../widgets/big_button.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //bool _showResendButton = false;
  String buttonText = "Send OTP";
  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    double? value = double.tryParse(s);
    return value != null && value >= 0;
  }

  bool validate = false;
  TextEditingController mobileNumber = TextEditingController();
  String otp = "";
  int otpCount = 0;
  int receivedUserId = 0;

  Future<void> registerUserPhoneId() async {
    try {
      var response = await loginUserWithPhone(mobileNumber.text);
      print("Response: $response");
      if (response != null && response['success'] == true) {
        final id = response['id'];
        if (id != null) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(response["message"]),
            ));
            setState(() {
              receivedUserId = id;
              otpCount++;
            });
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      print("$e");
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
              print(response["message"]);
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
          print("Error: $e");
        }
      }
    }
    return validate;
  }

  void changeButtonText() {
    setState(() {
      buttonText = "Resend OTP";
    });
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
                'assets/images/login1.png',
                height: 200,
                width: 200,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 70, 60, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MobileInputTextField(
                                validate: validate,
                                title: 'Enter Your Mobile Number',
                                txtController: mobileNumber),
                            Container(
                              color: Colors.black,
                              height: 35,
                              child: TextButton(
                                onPressed: () {
                                  // _showResendButton = true;
                                  changeButtonText();
                                },
                                child: Text(
                                  buttonText,
                                  // _showResendButton ? "Reseend OTP" : "Send OTP",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 60, 0),
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
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Allow only numbers
                              ],
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
                                        print('$response["message"]');
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
                                    print("Error: $e");
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
                      const TextWithLine(label: 'New User', height: 1),
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
          ],
        ),
      ),
    );
  }
}
