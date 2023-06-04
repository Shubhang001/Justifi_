import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';
import '../widgets/freezed_balance_vertical_tile.dart';
import '../widgets/statusPageFilterSort.dart';
import '../widgets/statusPageSearchBar.dart';

class FreezedBalancePage extends StatefulWidget {
  FreezedBalancePage({Key? key}) : super(key: key);

  @override
  State<FreezedBalancePage> createState() => _FreezedBalancePageState();
}

class _FreezedBalancePageState extends State<FreezedBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Freezed Balance",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
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
                        children: const [FreezedBalanceVerticalTile()],
                      ))
                    ]))));
  }
}
