import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/videoCallWidget.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import 'advocate_profile_table.dart';

class ApprovalPendingAdvocateCard extends StatelessWidget {
  const ApprovalPendingAdvocateCard(
      {super.key,
      required this.name,
      required this.image,
      required this.location,
      required this.rating,
      required this.date,
      required this.time,
      required this.duration,
      required this.caseTitle,
      required this.courtType,
      required this.caseCategory,
      required this.caseSubCategory,
      required this.paidAmount,
      required this.postingDate});

  final String image;
  final String name;
  final String location;
  final int rating;
  final String date;
  final String time;
  final int duration;
  final String caseTitle;
  final String courtType;
  final String caseCategory;
  final String caseSubCategory;
  final double paidAmount;
  final String postingDate;

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
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        rating.toString(),
                        style: kAdvocateCardRating,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Divider(
              color: kprimaryTextColor,
              thickness: 2,
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

            AdvocateProfileTable(
                caseTitle: caseTitle,
                courtType: courtType,
                caseCategory: caseCategory,
                caseSubCategory: caseSubCategory),
            SizedBox(
              height: 2,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VideoCallWidget(),
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
                        "Paid :",
                        style: paidTextStyle,
                      ),
                      Text(
                        "$paidAmount Rs",
                        style: tableTextNormal,
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.pending,
                        size: 20,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text(
                            " Approval",
                            style: tableTextNormal,
                          ),
                          Text(
                            " Pending",
                            style: tableTextNormal,
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: Row(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Posted On : ",
                        style: postedOnTextStyle,
                      ),
                      Text(
                        postingDate,
                        style: postedDateTextStyle,
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Cancel",
                    style: cancelTextStyle,
                  )
                ])),
            ////
          ],
        ),
      ),
    );
  }
}
