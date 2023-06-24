import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class AssignWorkCompleted extends StatelessWidget {
  const AssignWorkCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/check_mark.png'),
            Text(
              'Your Application has been submitted',
              textAlign: TextAlign.center,
              style: kAssignText,
            ),
            const CustomButton(
              removescreens: true,
              nextPage: MainPage(),
              buttonColor: Colors.black,
              text: 'View Status',
              width: 200,
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 1.5,
            )
          ],
        ),
      ),
    );
  }
}
