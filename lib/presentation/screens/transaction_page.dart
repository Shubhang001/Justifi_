import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import '../widgets/statusPageFilterSort.dart';
import '../widgets/statusPageSearchBar.dart';
import '../widgets/transaction_vertical_tile.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPage();
}

class _TransactionPage extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Transaction",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StatusPageSearchBar(),
                            SizedBox(
                              width: 10,
                            ),
                            StatusPageFilterSort()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: ListView(
                        scrollDirection: Axis.vertical,
                        children: const [TransactionVerticalTile()],
                      ))
                    ]))));
  }
}
