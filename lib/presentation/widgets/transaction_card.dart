import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/starrating.dart';
import 'package:jusitfi_admin/presentation/widgets/videoCallWidget.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../utils/constants/textstyles.dart';
import 'advocate_profile_table.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.image,
    required this.date,
    required this.time,
    required this.message,
    required this.transactionID,
    required this.paidAmount,
    required this.transactionType,
    required this.duration,
  });

  final String image;
  final String date;
  final String time;
  final String message;
  final String transactionType;
  final String transactionID;
  final int paidAmount;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                height: 80,
                width: 80,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Image.asset(image)),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionType.toString(),
                    style: poppinsW500S15White,
                  ),
                  Row(
                    children: [
                      Text(
                        date.toString(),
                        style: poppinsW500S10White,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        time.toString(),
                        style: poppinsW500S10White,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionID.toString(),
                    style: poppinsW500S15White,
                  ),
                  Text(
                    "Transaction Id: ",
                    style: poppinsW500S10White,
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "₹ $paidAmount",
                    style: poppinsW500S15White,
                  ),
                  transactionType.toString() == "Voice Call"
                      ? Row(
                          children: [
                            Text(
                              duration.toString(),
                              style: poppinsW500S10White,
                            ),
                            Text(
                              " min",
                              style: poppinsW500S10White,
                            )
                          ],
                        )
                      : Row(),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    message.toString(),
                    style: poppinsW500S15White,
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
