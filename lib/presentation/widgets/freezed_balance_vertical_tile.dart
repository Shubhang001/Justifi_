import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/approval_pending_advocate_card.dart';
import 'package:jusitfi_admin/presentation/widgets/freezed_balance_card.dart';

class FreezedBalanceVerticalTile extends StatelessWidget {
  const FreezedBalanceVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 400,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00 pm",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 700,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00 pm",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 1500,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 400,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00 pm",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 700,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00 pm",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 1500,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 400,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00 pm",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 700,
                ),
                FreezedBalanceCard(
                  image: 'assets/images/advocate_img.png',
                  date: "06 Oct 2022",
                  time: "5:00 pm",
                  duration: 60,
                  transactionID: "ZXER441289234412673",
                  paidAmount: 1500,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
