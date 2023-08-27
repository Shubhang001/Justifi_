import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/lawyer_profile.dart';
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
      padding: const EdgeInsets.all(11.5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const LawyerProfileScreen();
          }));
        },
        child: Container(
          width: 275,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        image,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/justify_logo.png",
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
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
                              size: 20,
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
                      mainAxisSize: MainAxisSize.min,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
