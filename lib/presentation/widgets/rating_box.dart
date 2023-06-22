import 'package:flutter/material.dart';

import '../../utils/constants/textstyles.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          Text(
            rating.toString(),
            style: kAdvocateCardRating,
          )
        ],
      ),
    );
  }
}
