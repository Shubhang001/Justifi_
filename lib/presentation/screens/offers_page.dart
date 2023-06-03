import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

import '../widgets/statusPageFilterSort.dart';
import '../widgets/statusPageSearchBar.dart';
import '../widgets/transaction_vertical_tile.dart';

class OffersPage extends StatefulWidget {
  OffersPage({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPage();
}

class _OffersPage extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Offers",
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 200,
                            //width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset("assets/images/advocate_tie.png"),
                                Text(
                                  "Add Money",
                                  style: poppinsW700S14White,
                                ),
                                Text(
                                  "15% Extra Money",
                                  style: poppinsW600S14White,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Code : 23HT873 ",
                                        style: poppinsW500S15White,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    ]),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            //rwidth: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset("assets/images/advocate_tie.png"),
                                Text(
                                  "One Time Hiring",
                                  style: poppinsW700S14White,
                                ),
                                Text(
                                  "15% Discount",
                                  style: poppinsW600S14White,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Code : 23HT873 ",
                                        style: poppinsW500S15White,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    ]),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]))));
  }
}
