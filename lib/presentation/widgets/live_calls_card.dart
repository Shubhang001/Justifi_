import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/rating_box.dart';
import 'package:jusitfi_admin/presentation/widgets/review_alert_dialog.dart';
import '../../utils/constants/textstyles.dart';

class LiveCallsCard extends StatelessWidget {
  const LiveCallsCard({
    super.key,
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.date,
    required this.time,
    required this.duration,
    required this.paidAmount,
    required this.callType,
  });

  final String image;
  final String name;
  final String location;
  final int rating;
  final String date;
  final String time;
  final int duration;
  final double paidAmount;
  final String callType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  image,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: kAdvocateCardNameWhite,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/icons/location_icon.png"),
                        Text(
                          location,
                          style: kAdvocateCardLocationWhite,
                        )
                      ],
                    )
                  ],
                ),
                Column(children: [
                  RatingBox(rating: rating),
                ])
              ],
            ),

            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      Text(
                        date,
                        style: kDateandTimeWhite,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 16,
                          width: 16,
                          child: Image.asset(
                            "assets/icons/time_clock.png",
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        time.toString(),
                        style: kDateandTimeWhite,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      Text(
                        "$duration minutes",
                        style: kDateandTimeWhite,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        callType.toString() == "Video Call"
                            ? Icon(
                                Icons.videocam,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                        Text(
                          callType,
                          style: tableTextBold,
                        )
                      ]),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "$paidAmount",
                        style: tableTextNormal,
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      //show alert dialo
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ReviewDialogBox();
                          });
                    },
                    child: Center(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "View Review",
                            style: tableTextBoldBlack,
                          )),
                    ),
                  )
                ],
              ),
            ),

            ////
          ],
        ),
      ),
    );
  }
}
