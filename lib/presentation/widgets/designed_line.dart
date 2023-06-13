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
        const CircleAvatar(
          backgroundColor: Colors.black,
          radius: 3,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ),
        const CircleAvatar(
          backgroundColor: Colors.black,
          radius: 3,
        ),
      ],
    );
  }
}
