import 'package:flutter/material.dart';

import '../../utils/constants/textstyles.dart';

class smallButton extends StatelessWidget {
  smallButton({super.key, required this.nextPage, required this.name});
  Widget nextPage;
  String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => nextPage));
      },
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            name,
            style: kMainCategory,
          ),
        ),
      ),
    );
  }
}
