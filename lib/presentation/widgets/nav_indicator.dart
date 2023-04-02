import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class NavIndicator extends StatelessWidget {
  const NavIndicator({
    super.key,
    required this.currentintro,
  });

  final int currentintro;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: currentintro == 0
              ? kobbuttonColor
              : kinactive,
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: currentintro == 1
              ? kobbuttonColor
              : kinactive,
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor:
              currentintro == 2 ? kobbuttonColor :kinactive ,
        )
      ],
    );
  }
}
