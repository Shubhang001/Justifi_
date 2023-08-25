import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/lawyer_profile.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import '../../utils/constants/textstyles.dart';

class AdvocateCardFloatCases extends StatelessWidget {
  const AdvocateCardFloatCases(
      {super.key,
      required this.name,
      required this.image,
      required this.location,
      required this.distance,
      required this.rating,
      required this.clients,
      required this.cases,
      required this.experience});

  final String image;
  final String name;
  final String location;
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
          height: 270,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey, width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 65.0,
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
                      radius: 55.0,
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
              ),
              Container(
                color: Colors.white,
                child: Column(children: [
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
                            location,
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
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: Container(
              //       height: 20,
              //       width: 80,
              //       decoration: BoxDecoration(
              //           color: Colors.green,
              //           borderRadius: BorderRadius.circular(2)),
              //       child: Center(
              //         child: Text(
              //           'View Profile',
              //           style: kProfileButtonText,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
