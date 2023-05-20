import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/approval_pending_advocate_card.dart';
import 'package:jusitfi_admin/presentation/widgets/freezed_balance_card.dart';
import 'package:jusitfi_admin/presentation/widgets/transaction_card.dart';

class TransactionVerticalTile extends StatelessWidget {
  const TransactionVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                TransactionCard(
                    image: 'assets/images/coin_wallet.png',
                    date: "06 Oct 2022",
                    time: "5:00",
                    message: "Success",
                    transactionID: "EUIT224373773273247",
                    paidAmount: 5000,
                    transactionType: "Add Money",
                    duration: "60"),
                TransactionCard(
                    image: 'assets/icons/document_icon.png',
                    date: "06 Oct 2022",
                    time: "5:00",
                    message: "Freezed",
                    transactionID: "EUIT224373773273247",
                    paidAmount: 699,
                    transactionType: "Divorce Resolution",
                    duration: "60"),
                TransactionCard(
                    image: 'assets/images/advocate_img.png',
                    date: "06 Oct 2022",
                    time: "5:00",
                    message: "Success",
                    transactionID: "ZXER441289234412673",
                    paidAmount: 400,
                    transactionType: "Voice Call",
                    duration: "60"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
