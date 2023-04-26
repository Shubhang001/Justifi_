import 'package:flutter/material.dart';

import '../../utils/constants/textstyles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.removescreens,
      required this.nextPage,
      required this.buttonColor,
      required this.text,
      this.function = dummy,
      this.width,
      this.height});
  final bool removescreens;
  final Widget nextPage;
  final String text;
  final Color buttonColor;
  final double? width;
  final double? height;
  final Function function;

  static void dummy() {}

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var status = widget.function();
        if (status == false || status == null) {
          widget.removescreens
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => widget.nextPage),
                  (Route<dynamic> route) => false)
              : Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widget.nextPage));
        }
      },
      child: Container(
        height: widget.height ?? 50,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
            color: widget.buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          widget.text,
          style: kpageTitle,
        )),
      ),
    );
  }
}
