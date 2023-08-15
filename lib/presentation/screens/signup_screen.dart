import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/login_screen.dart';
import 'package:jusitfi_admin/presentation/widgets/dob_picker.dart';
import 'package:jusitfi_admin/presentation/widgets/img_picker_container.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/models/usermodel.dart';
import 'package:jusitfi_admin/utils/services/rest_apis.dart';
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
    // ignore: unnecessary_null_comparison
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
    ];
    setState(() {
      values.contains(true) ? validate = true : validate = false;
    });

    if (!validate) {
      try {
        UserEmailModel userEmailModel =
            registerUserWithPhone(emailController.text, "1");
        if (userEmailModel.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(userEmailModel.message),
          ));
        }

        UserPhoneModel userPhoneModel =
            registerUserWithEmail(mobileNumberController.text, "1");
        if (userPhoneModel.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(userPhoneModel.message),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Something went wrong'),
        ));
      }
    }

    return validate;
  }

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
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
                      Icons.person_outlined,
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
                ImagePickerContainer(),
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
                            const ImportantText(text: 'DOB'),
                            const SizedBox(
                              height: 3,
                            ),
                            DOBPicker()
                          ],
                        ),
                      ),
                    ],
                  ),
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
                InkWell(
                  onTap: () {
                    var status = checkValidation();
                    if (status == false) {
                      DialogSuccess.showSuccessDialog(context);
                    } else {
                      print('Not Validated');
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kbuttonColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Submit',
                      style: kpageTitle,
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DialogSuccess {
  static void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          title: const Text('User Registered'),
          content: const Text('User Registered Successfully'),
          actions: [
            ElevatedButton(
              child: const Text('Login Now'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return LoginScreen();
                }));
              },
            ),
          ],
        );
      },
    );
  }
}
