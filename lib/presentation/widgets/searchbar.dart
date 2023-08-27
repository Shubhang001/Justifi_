import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class SearchBarUpdated extends StatelessWidget {
  const SearchBarUpdated(
      {super.key, required this.backgroundColor, required this.color});
  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width / 1.6,
      height: 50,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: kmainButtonColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search....',
                hintStyle: ksearch,
              ),
            ),
          )
        ],
      ),
    );
  }
}
