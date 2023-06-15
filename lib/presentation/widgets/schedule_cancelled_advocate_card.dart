import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/cancellation_dialog_box.dart';
import 'package:jusitfi_admin/presentation/widgets/cancelled_advocate_card_table.dart';
import '../../utils/constants/textstyles.dart';

class ScheduledCancelledAdvocateCard extends StatelessWidget {
  const ScheduledCancelledAdvocateCard({
    super.key,
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
    required this.canceledDate,
    required this.canceledBy,
  });

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
  final String canceledDate;
  final String canceledBy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
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
                  Container(
                    padding: const EdgeInsets.only(left: 8, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          rating.toString(),
                          style: kAdvocateCardRating,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset(
                            "assets/icons/time_clock.png",
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        time,
                        style: kAdvocateCardLocationWhite,
                      )
                    ],
                  )
                ])
              ],
            ),
            CancelledAdvocateCardTable(
              caseTitle: caseTitle,
              courtType: courtType,
              caseCategory: caseCategory,
              caseSubCategory: caseSubCategory,
              cancelledDate: canceledDate,
              cancelledBy: canceledBy,
            ),
            const SizedBox(
              height: 2,
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
                      const Icon(
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
                  const VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.cancel_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text(
                            " Meet Status",
                            style: tableTextNormal,
                          ),
                          Text(
                            " Canceled",
                            style: tableTextBold,
                          )
                        ],
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
            ////
          ],
        ),
      ),
    );
  }
}
