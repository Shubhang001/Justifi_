import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/profile_appbar.dart';

import '../widgets/qna_widget.dart';

class UpiPrevention extends StatelessWidget {
  const UpiPrevention({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileNavBar(),
          Container(
            width: double.infinity,
            height: 20,
            color: const Color.fromRGBO(222, 226, 230, 1),
          ),
          Container(
            height: 60,
            color: Colors.black,
            child: const Center(
              child: Text(
                "Upi Prevention",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromRGBO(241, 236, 236, 1),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const QnaWidget(
                      question:
                          "i) In publishing and graphic design, Lorem ipsum is a placeholder text commonly used ?",
                      answer:
                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonl .",
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const QnaWidget(
                      question:
                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used ?",
                      answer:
                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonl .",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
