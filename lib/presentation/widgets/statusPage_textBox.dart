import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';

class TextBox extends StatefulWidget {
  String? text;
  bool? isSelected;
  int? textSize;
  TextBox(
      {required this.text, required this.isSelected, required this.textSize});

  @override
  State<TextBox> createState() => _TextBoxState();
}

Color? textColor;
Color? backgrounColor;

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.isSelected == true) {
      textColor = Colors.white;
      backgrounColor = kPrimaryBlackColor;
    } else {
      textColor = Colors.black;
      backgrounColor = Colors.white;
    }
    return Container(
        margin: EdgeInsets.all(10),
        color: backgrounColor,
        alignment: Alignment.center,
        child: Text(widget.text.toString(),
            style: TextStyle(
                color: textColor, fontSize: widget.textSize!.toDouble())));
  }
}
