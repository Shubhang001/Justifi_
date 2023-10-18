import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const FloatCases()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
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
