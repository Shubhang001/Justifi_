import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, this.backgroundColor = Colors.black});
  final Color backgroundColor;

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
              style: kotp,
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
