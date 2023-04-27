import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/finished_page.dart';
import 'package:jusitfi_admin/presentation/screens/float_cases4.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases2.dart';

class FloatCases extends StatefulWidget {
  const FloatCases({super.key});

  @override
  State<FloatCases> createState() => _FloatCasesState();
}

class _FloatCasesState extends State<FloatCases> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FinishedPage(text: 'Your application has been submitted', nextPage: FloatCases4(), nextPageName: 'View Status'), ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FloatCases2(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 3,
            bottom: MediaQuery.of(context).size.height / 2 - 30,
            child: Center(child: Image.asset('assets/images/float_icon.png'))),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
          ),
        )
      ]),
    );
  }
}
