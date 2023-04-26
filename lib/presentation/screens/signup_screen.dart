import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/onboardingscreen.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import '../widgets/drop_down.dart';
import '../widgets/importanttext.dart';
import '../widgets/inputtextfield.dart';
import '../widgets/mobilenumberfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool validate = false;

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool checkValidation() {
    print(mobileNumberController.text.length);
    List values = [
      mobileNumberController.text.isEmpty ||
          mobileNumberController.text.length != 10 ||
          !isNumeric(mobileNumberController.text),
      firstNameController.text.isEmpty,
      lastNameController.text.isEmpty,
      emailController.text.isEmpty,
      addressController.text.isEmpty
    ];
    setState(() {
      values.contains(true) ? validate = true : validate = false;
    });
    return validate;
  }

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  bool isAccepted = false;
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Sign Up  ',
                        style: kpageTitle,
                      ),
                    ),
                    const Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Complete Your Profile',
                    style: ktextFieldMainTitle,
                  ),
                ),
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
                InputTextField(
                  errorText: 'First Name Should Be Filled',
                  validate: validate,
                  title: 'First Name',
                  txtController: firstNameController,
                ),
                InputTextField(
                  errorText: 'Second Name Should Be Filled',
                  validate: validate,
                  title: 'Last Name',
                  txtController: lastNameController,
                ),
                InputTextField(
                  errorText: 'Email is mandatory',
                  validate: validate,
                  title: 'Email',
                  txtController: emailController,
                  icon: const Icon(
                    Icons.mail_outline,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ImportantText(text: 'Gender'),
                            const SizedBox(
                              height: 3,
                            ),
                            AppDropdownInput(
                              options: const ["Male", "Female"],
                              value: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                  // state.didChange(newValue);
                                });
                              },
                              getLabel: (String value) => value,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ImportantText(
                              text: 'Date Of Birth',
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            AppDropdownInput(
                              options: const ["Male", "Female"],
                              value: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                  // state.didChange(newValue);
                                });
                              },
                              getLabel: (String value) => value,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InputTextField(
                  errorText: 'Address must be entered',
                  validate: validate,
                  title: 'Address',
                  txtController: addressController,
                ),
                MobileInputTextField(
                    validate: validate,
                    title: 'Enter Your Mobile Number',
                    txtController: mobileNumberController),
                Row(
                  children: [
                    Checkbox(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: Colors.black,
                        value: isAccepted,
                        onChanged: (value) {
                          setState(() {
                            isAccepted = value!;
                          });
                          print(value);
                        }),
                    const Text(
                      'I Accept Terms And Conditions',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 38),
                    child: CustomButton(
                        function: checkValidation,
                        removescreens: true,
                        nextPage: const OnBoardingScreen(),
                        buttonColor: kbuttonColor,
                        text: 'Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
