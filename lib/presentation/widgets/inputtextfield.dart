import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/importanttext.dart';

import '../../utils/constants/textstyles.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {super.key,
      required this.title,
      required this.txtController,
      this.icon,
      required this.validate,
      required this.errorText});

  final Icon? icon;
  final String title;
  final TextEditingController txtController;
  final bool validate;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        // height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImportantText(text: title),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: txtController,
              style: kTextFieldValue,
              decoration: InputDecoration(
                  errorText: validate && txtController.text.isEmpty
                      ? errorText
                      : null,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: icon,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ],
        ),
      ),
    );
  }
}
