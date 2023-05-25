import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';

import '../../utils/constants/textstyles.dart';
import '../screens/finished_page.dart';

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
        child: Center(
          child: Text(
            name,
            style: kMainCategory,
          ),
        ),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
