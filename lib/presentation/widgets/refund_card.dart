import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/cancellation_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/refund_table.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import 'package:jusitfi_admin/presentation/widgets/videoCallWidget.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../utils/constants/textstyles.dart';
import 'advocate_profile_table.dart';

class RefundCard extends StatelessWidget {
  const RefundCard(
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
      required this.postingDate,
      required this.refundDate,
      required this.refundAmount,
      required this.refundTime,
      required this.meetStatus,
      required this.cancelledBy});

  final String image;
  final String name;
  final String location;
  final double rating;
  final String date;
  final String time;
  final int duration;
  final String caseTitle;
  final String courtType;
  final String caseCategory;
  final String caseSubCategory;
  final double paidAmount;
  final String postingDate;
  final String refundDate;
  final String refundAmount;
  final String cancelledBy;
  final String refundTime;
  final String meetStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  date.toString() + " ",
                  style: kDateandTimeWhite,
                ),
                Text(
                  time.toString(),
                  style: kDateandTimeWhite,
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      image,
                    ),
                    Text(
                      name,
                      style: kAdvocateCardNameWhite,
                    ),
                    Container(
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
                RefundTable(
                    caseTitle: caseTitle,
                    courtType: courtType,
                    caseCategory: caseCategory,
                    caseSubCategory: caseSubCategory,
                    refundDate: refundDate,
                    refundTime: refundTime,
                    cancelledBy: cancelledBy,
                    refundAmount: refundAmount,
                    meetStatus: meetStatus)
              ],
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        " Duration",
                        style: tableTextBold,
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
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Icon(
                    Icons.videocam,
                    color: Colors.white,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.pending_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text(
                            "Refund Status",
                            style: tableTextNormal,
                          ),
                          Text(
                            " In Progress",
                            style: tableTextBold,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                //show alert dialo
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CancellationDialogBox();
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
                      "View Cancellation Reason",
                      style: tableTextBoldBlack,
                    )),
              ),
            )
          ]),
        ));
  }
}
