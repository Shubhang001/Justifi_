import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import '../../utils/constants/textstyles.dart';

class AdvocateCard extends StatelessWidget {
  const AdvocateCard(
      {super.key,
      required this.name,
      required this.image,
      required this.education,
      required this.distance,
      required this.rating});

  final String image;
  final String name;
  final String education;
  final double distance;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 119,
        width: 119,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kAdvocateCardName,
                    ),
                    Text(
                      education,
                      style: kAdvocateCardSubTitle,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          color: Colors.red,
                          size: 10,
                        ),
                        Text(
                          '$distance kms from your location',
                          style: kAdvocateCardLocation,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      rating.toString(),
                      style: kAdvocateCardRating,
                    ),
                    StarRating(rating: rating)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
