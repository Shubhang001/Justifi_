import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class StatusPageSearchBar extends StatelessWidget {
  const StatusPageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kprimaryTextColor, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width / 1.78,
      height: 50,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          // Icon(
          //   Icons.search,
          //   size: 30,
          //   color: Colors.black,
          // ),
          // const SizedBox(
          //   width: 10,
          // ),
          Expanded(
            child: TextField(
              style: kotp,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
