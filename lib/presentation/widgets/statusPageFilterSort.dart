import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class StatusPageFilterSort extends StatelessWidget {
  const StatusPageFilterSort({super.key, this.isDark = true});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
            color: isDark ? kprimaryTextColor : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              child: Row(children: const [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                Icon(Icons.arrow_downward_rounded,
                    color: Colors.black, size: 20),
              ]),
            ),
            VerticalDivider(
              color: isDark ? Colors.white : Colors.black,
            ),
            Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  "assets/icons/sort_3lines.png",
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
