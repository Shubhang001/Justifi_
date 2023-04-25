import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/mianpage.dart';
import 'package:jusitfi_admin/presentation/widgets/big_button.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class FinishedPage extends StatelessWidget {
  FinishedPage(
      {super.key,
      required this.text,
      required this.nextPage,
      required this.nextPageName});
  String text;
  String nextPageName;
  Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/images/check_mark.png'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: kAssignText,
                ),
              ],
            ),
            CustomButton(
              removescreens: true,
              nextPage: nextPage,
              buttonColor: Colors.black,
              text: nextPageName,
              width: 200,
            ),
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height / 3,
            )
          ],
        ),
      ),
    );
  }
}
