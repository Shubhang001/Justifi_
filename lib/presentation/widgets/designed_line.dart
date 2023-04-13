import 'package:flutter/material.dart';

class DesignedLine extends StatelessWidget {
  const DesignedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 3,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 3,
        ),
      ],
    );
  }
}
