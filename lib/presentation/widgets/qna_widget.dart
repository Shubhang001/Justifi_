import 'package:flutter/material.dart';

class QnaWidget extends StatelessWidget {
  const QnaWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              answer,
            ))
      ],
    );
  }
}
