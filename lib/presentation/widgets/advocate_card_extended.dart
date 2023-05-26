import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/lawyer_profile.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import '../../utils/constants/textstyles.dart';

class AdvocateCardExtended extends StatelessWidget {
  const AdvocateCardExtended(
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LawyerProfileScreen(),
              ));
        },
        child: Container(
          height: 165,
          width: 136,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                width: 136,
                height: 90,
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
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '80',
                          style: kAdvocateCardCount,
                        ),
                        Text(
                          'Clients',
                          style: kAdvocateCardCountTitle,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text(
                          '80',
                          style: kAdvocateCardCount,
                        ),
                        Text(
                          'Cases',
                          style: kAdvocateCardCountTitle,
                        )
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Text(
                          '80',
                          style: kAdvocateCardCount,
                        ),
                        Text(
                          'Experiences',
                          style: kAdvocateCardCountTitle,
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
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '80',
                        style: kAdvocateCardCount,
                      ),
                      Text(
                        'Clients',
                        style: kAdvocateCardCountTitle,
                      )
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Text(
                        '80',
                        style: kAdvocateCardCount,
                      ),
                      Text(
                        'Cases',
                        style: kAdvocateCardCountTitle,
                      )
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Text(
                        '80',
                        style: kAdvocateCardCount,
                      ),
                      Text(
                        'Experiences',
                        style: kAdvocateCardCountTitle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 10,
                  width: 44,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: Text(
                      'View Profile',
                      style: kProfileButtonText,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
  }
}
