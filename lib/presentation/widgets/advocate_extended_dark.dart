import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import '../../utils/constants/textstyles.dart';

class AdvocateCardExtendedDark extends StatelessWidget {
  const AdvocateCardExtendedDark(
      {super.key,
      required this.name,
      required this.image,
      required this.education,
      required this.distance,
      required this.rating,
      required this.clients,
      required this.cases,
      required this.experience});

  final String image;
  final String name;
  final String education;
  final double distance;
  final double rating;
  final int cases;
  final int clients;
  final int experience;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              width: 170,
              height: 100,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kAdvocateCardNameDark,
                    ),
                    Text(
                      education,
                      style: kAdvocateCardSubTitleDark,
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
                          style: kAdvocateCardLocationDark,
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
                      style: kAdvocateCardRatingDark,
                    ),
                    StarRating(rating: rating)
                  ],
                )
              ],
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '80',
                        style: kAdvocateCardCountDark,
                      ),
                      Text(
                        'Clients',
                        style: kAdvocateCardCountTitleDark,
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Text(
                        '80',
                        style: kAdvocateCardCountDark,
                      ),
                      Text(
                        'Cases',
                        style: kAdvocateCardCountTitleDark,
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      Text(
                        '80',
                        style: kAdvocateCardCountDark,
                      ),
                      Text(
                        'Experiences',
                        style: kAdvocateCardCountTitleDark,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
