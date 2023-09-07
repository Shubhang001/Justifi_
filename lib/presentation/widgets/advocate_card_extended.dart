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
      required this.userid,
      required this.cases,
      required this.experience,
      required this.place});

  final String image;
  final String name;
  final String education;
  final num distance;
  final double rating;
  final num cases;
  final num clients;
  final num experience;
  final String place;
  final int userid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LawyerProfileScreen(
                  userid: userid,
                  name: name,
                  image: image,
                  education: education,
                  rating: rating,
                  cases: cases,
                  clients: clients,
                  experience: experience,
                  place: place,
                ),
              ));
        },
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0),
              color: Colors.black,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network(
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
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
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
                              ),
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
                    ),
                    Container(
                      color: Colors.white,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  clients.toString(),
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
                                  cases.toString(),
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
                                  experience.toString(),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 20,
                          width: 80,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
