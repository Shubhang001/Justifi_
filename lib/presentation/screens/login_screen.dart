import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/screens/signup_screen.dart';
import 'package:jusitfi_admin/presentation/widgets/mobilenumberfield.dart';
import 'package:jusitfi_admin/presentation/widgets/text_with_line.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../utils/constants/colors.dart';
import '../widgets/big_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool validate = false;
  TextEditingController mobileNumber = TextEditingController();
  bool checkValidation() {
    setState(() {
      mobileNumber.text.isEmpty ||
              !isNumeric(mobileNumber.text) ||
              mobileNumber.text.length != 10
          ? validate = true
          : validate = false;
    });
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 36),
                child: Row(
                  children: [
                    Text(
                      'Log In   ',
                      style: kpageTitleBlack,
                    ),
                    const Icon(Icons.person_2_outlined)
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, 15.0, 0.0),
                child: Image.asset(
                  'assets/images/login.png',
                ),
              ),
              Container(
                height: 600,
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
                      padding: const EdgeInsets.fromLTRB(60, 80, 60, 0),
                      child: MobileInputTextField(
                          validate: validate,
                          title: 'Enter Your Mobile Number',
                          txtController: mobileNumber),
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
                            fieldWidth: 35,
                            decoration:
                                const InputDecoration(fillColor: Colors.white),
                            numberOfFields: 5,
                            showFieldAsBox: false,
                            onSubmit: (String verificationCode) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                      child: CustomButton(
                        function: checkValidation,
                        removescreens: true,
                        nextPage: const MainPage(),
                        buttonColor: kmainButtonColor,
                        text: 'Login',
                      ),
                    ),
                    const TextWithLine(label: 'New User', height: 1),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
