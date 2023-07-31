import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/add_money_page.dart';
import 'package:jusitfi_admin/presentation/screens/freezed_balance_page.dart';
import 'package:jusitfi_admin/presentation/screens/hiring_package_page.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/presentation/screens/transaction_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../../utils/constants/colors.dart';

class WalletPage extends StatefulWidget {
  const WalletPage(
      {Key? key,
      required this.userName,
      required this.userImage,
      required this.userLocation})
      : super(key: key);
  final String userName;
  final String userImage;
  final String userLocation;
  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            child: Image.asset(
              'assets/icons/profile_new.png',
              color: Colors.white,
              width: 38,
              height: 38,
            ),
          ),
          title: Center(
            child: Text(
              "Wallet",
              style: alegreyaW700S24White,
            ),
          ),
          backgroundColor: kPrimaryBlackColor,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  widget.userImage.toString(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: poppinsW500S18Black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/icons/place_marker.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          widget.userLocation,
                          style: poppinsW400S12Black,
                        )
                      ],
                    )
                  ],
                ),
              ]),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Container(
                          height: 54,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black),
                          child: Center(
                              child: Image.asset(
                            "assets/icons/Withdrawal.png",
                            fit: BoxFit.cover,
                          )),
                        )),
                    Text(
                      "Active Hiring",
                      style: poppinsW500S12Black,
                    ),
                    Text(
                      "Packages",
                      style: poppinsW500S12Black,
                    )
                  ]),
                  Column(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddMoneyPage(
                                  currentWalletBalance: '1455',
                                )));
                      },
                      child: Container(
                        height: 54,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        )),
                      ),
                    ),
                    Text(
                      "Add",
                      style: poppinsW500S12Black,
                    ),
                    Text(
                      "Balance",
                      style: poppinsW500S12Black,
                    )
                  ]),
                  Column(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OffersPage()));
                        },
                        child: Container(
                          height: 54,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black),
                          child: Center(
                              child: Image.asset("assets/icons/Discount.png")),
                        )),
                    Text(
                      "Offers",
                      style: poppinsW500S12Black,
                    ),
                  ]),
                  Column(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TransactionPage()));
                        },
                        child: Container(
                          height: 54,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black),
                          child: Center(
                              child:
                                  Image.asset("assets/icons/Transaction.png")),
                        )),
                    Text(
                      "Transaction",
                      style: poppinsW500S12Black,
                    ),
                  ]),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FreezedBalancePage()));
                  },
                  child: Container(
                      height: 100,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/frozen_balance_image.png",
                          fit: BoxFit.fill,
                        ),
                      ))),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Image.asset("assets/images/avail_bal_image.png"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 100,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset("assets/images/total_bal_image.png"),
                    )),
              ),
              Center(
                  child: Text(
                "Buy Hiring packages as per your need ",
                style: interW400S18Black,
              )),
              const SizedBox(
                height: 5,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 2.0, color: Colors.black),
                children: [
                  TableRow(children: [
                    Container(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Profile ", style: interW400S14Black),
                        Text(
                          " Hiring",
                          style: interW400S14Black,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Post ", style: interW400S14Black),
                        Text(
                          " Hiring",
                          style: interW400S14Black,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Profile ", style: interW400S14Black),
                        Text(
                          " + ",
                          style: interW400S14Black,
                        ),
                        Text("Post Hiring", style: interW400S14Black),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Center(child: Text("1 Time ", style: interW400S14Black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    Center(
                        child: Text(
                      "----",
                      style: interW400S14Black,
                    )),
                  ]),
                  TableRow(children: [
                    Center(child: Text("Monthly", style: interW400S14Black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                  ]),
                  TableRow(children: [
                    Center(child: Text("Quarterly", style: interW400S14Black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HiringPackagePage()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black),
                          )),
                    ),
                  ]),
                  TableRow(children: [
                    Center(child: Text("Yearly", style: interW400S14Black)),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HiringPackagePage()));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                  child: Text(
                                "₹199",
                                style: poppinsW500S12White,
                              )),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black),
                        )),
                  ]),
                ],
              ),
            ])));
  }
}
