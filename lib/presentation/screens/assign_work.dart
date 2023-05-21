import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../widgets/wave_clipper.dart';

class AssignWork extends StatelessWidget {
  const AssignWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/check_mark.png'),
            Text(
              'Your Feedback has been submitted',
              textAlign: TextAlign.center,
              style: kAssignText,
            ),
            CustomButton(
              removescreens: true,
              nextPage: MainPage(),
              buttonColor: Colors.black,
              text: 'Home',
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ClipPath(
                child: Container(
                  width: 500,
                  height: 200,
                  color: Colors.grey,
                ),
                clipper: CustomClipPath(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
