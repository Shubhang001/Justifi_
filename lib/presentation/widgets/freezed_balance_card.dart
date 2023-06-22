import 'package:flutter/material.dart';
import '../../utils/constants/textstyles.dart';

class FreezedBalanceCard extends StatelessWidget {
  const FreezedBalanceCard({
    super.key,
    required this.image,
    required this.date,
    required this.time,
    required this.duration,
    required this.transactionID,
    required this.paidAmount,
  });

  final String image;

  final String date;
  final String time;
  final int duration;
  final String transactionID;
  final int paidAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
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
                    "Voice Call",
                    style: poppinsW500S15White,
                  ),
                  Row(
                    children: [
                      Text(
                        date.toString(),
                        style: poppinsW500S10White,
                      ),
                      const SizedBox(
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
              const SizedBox(
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
                  Row(
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
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    "Frozen",
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
