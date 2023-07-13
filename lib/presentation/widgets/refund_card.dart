import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/cancellation_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/rating_box.dart';
import 'package:jusitfi_admin/presentation/widgets/refund_table.dart';
import '../../utils/constants/textstyles.dart';

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
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$date ",
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
                    RatingBox(rating: rating),
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
                          const Icon(
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
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  const Icon(
                    Icons.videocam,
                    color: Colors.white,
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          'assets/icons/coin_symbol.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Text(
                        "Paid :",
                        style: paidTextStyle,
                      ),
                      Text(
                        "$paidAmount",
                        style: tableTextNormal,
                      )
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Container(
                      child: Column(
                    children: [
                      Text(
                        "Refund Status",
                        style: tableTextNormal,
                      ),
                      const Icon(
                        Icons.pending_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        " In Progress",
                        style: tableTextBold,
                      )
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                //show alert dialo
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CancellationDialogBox();
                    });
              },
              child: Center(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    padding: const EdgeInsets.all(8),
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
