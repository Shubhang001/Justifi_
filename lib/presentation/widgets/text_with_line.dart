import 'package:flutter/material.dart';

class TextWithLine extends StatelessWidget {
  const TextWithLine({
    super.key,
    required this.label,
    required this.height,
    required this.color,
  });

  final String label;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: color,
              height: height,
            )),
      ),
      Text(
        label,
        style: TextStyle(
          color: color,
          fontStyle: FontStyle.normal,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: color,
              height: height,
            )),
      ),
    ]);
  }
}
