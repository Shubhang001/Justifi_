import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class StatusPageFilterSort extends StatelessWidget {
  const StatusPageFilterSort({super.key, this.isDark = true});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 30,
        height: 50,
        decoration: BoxDecoration(
            color: isDark ? kprimaryTextColor : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.arrow_upward_rounded,
              color: Colors.black,
            ),
            VerticalDivider(
              color: isDark ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.menu,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
