import 'package:flutter/material.dart';

import '../../utils/constants/textstyles.dart';

class MobileInputTextField extends StatelessWidget {
  const MobileInputTextField(
      {super.key,
      required this.title,
      required this.txtController,
      required this.validate});

  final String title;
  final TextEditingController txtController;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text:
                  TextSpan(text: title, style: ktextFieldMainTitle, children: [
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: ktextFieldTitle.fontWeight,
                        fontSize: ktextFieldTitle.fontSize))
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              child: TextField(
                maxLength: 10,
                keyboardType: TextInputType.phone,
                controller: txtController,
                style: kTextFieldValue,
                decoration: InputDecoration(
                    errorText: validate && txtController.text.length < 10
                        ? 'Enter a Valid Mobile Number'
                        : null,
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 2.5),
                      child: Text(
                        '+91',
                        style: kTextFieldValue,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints.tight(const Size(35, 35)),
                    hintText: '9999999999',
                    hintStyle: kTextFieldValue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
