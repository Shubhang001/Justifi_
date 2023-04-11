import 'package:flutter/material.dart';

import '../../utils/constants/textstyles.dart';

class ImportantText extends StatelessWidget {
  const ImportantText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: text, style: ktextFieldTitle, children: [
        TextSpan(
            text: ' *',
            style: TextStyle(
                color: Colors.red,
                fontWeight: ktextFieldTitle.fontWeight,
                fontSize: ktextFieldTitle.fontSize))
      ]),
    );
  }
}
