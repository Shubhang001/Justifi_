import 'package:flutter/material.dart';

import '../../utils/constants/textstyles.dart';


class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {super.key,
      required this.image,
      required this.name,
      this.isTransparentBackground = true});
  final String image;
  final String name;
  final bool isTransparentBackground;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isTransparentBackground ? null : Colors.black,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Image.asset(
            height: 60,
            width: 60,
            image,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          name,
          style: kCategoryName,
        )
      ],
    );
  }
}
