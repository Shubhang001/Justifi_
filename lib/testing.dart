import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/finished_page.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases8.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases9.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/screens/schedule3.dart';
import 'package:jusitfi_admin/presentation/widgets/show_schedule_details.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import 'presentation/widgets/show_call_details.dart';
import 'presentation/widgets/show_review.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FloatCases()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: kobdescriptionColor,
                ),
                child: Center(
                  child: Text(
                    'Float-Cases',
                    style: kpageTitle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
