import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/screens/add_coin_page.dart';
import 'package:jusitfi_admin/presentation/screens/add_credits_page.dart';
import 'package:jusitfi_admin/presentation/screens/freezed_balance_page.dart';
import 'package:jusitfi_admin/presentation/screens/hiring_credits_page.dart';
import 'package:jusitfi_admin/presentation/screens/notification_page.dart';
import 'package:jusitfi_admin/presentation/screens/offers_page.dart';
import 'package:jusitfi_admin/presentation/screens/profile_page.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

import '../../testing_transaction_page.dart';
import '../../utils/constants/colors.dart';
import 'frozen_coin.dart';

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
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsPage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
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
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/icons/profile_new.png',
                color: Colors.white,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wallet",
                style: klocationLight,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const HiringCreditsPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            height: 54,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black),
                            child: Center(
                                child: Image.asset(
                              "assets/icons/hiring_package_u.png",
                              fit: BoxFit.cover,
                            )),
                          )),
                      Text(
                        "Hiring",
                        style: poppinsW500S12Black,
                      ),
                      Text(
                        "Credits",
                        style: poppinsW500S12Black,
                      )
                    ]),
                    Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddCoinPage()));
                        },
                        child: Container(
                          height: 54,
                          width: 48,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black),
                          child: Center(
                              child: Image.asset(
                            "assets/icons/add_coins_u.png",
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                      Text(
                        "Add",
                        style: poppinsW500S12Black,
                      ),
                      Text(
                        "Coins",
                        style: poppinsW500S12Black,
                      )
                    ]),
                    Column(children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OffersPage()));
                          },
                          child: Container(
                            height: 54,
                            width: 48,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black),
                            child: Center(
                                child: Image.asset("assets/icons/offers_u.png",
                                    fit: BoxFit.cover)),
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
                                builder: (context) =>
                                    const WalletTransactionPage()));
                          },
                          child: Container(
                            height: 54,
                            width: 48,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black),
                            child: Center(
                                child: Image.asset(
                              "assets/icons/transaction_u.png",
                              fit: BoxFit.cover,
                            )),
                          )),
                      Text(
                        "Transaction",
                        style: poppinsW500S12Black,
                      ),
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FrozenCoinBalanceScreen()));
                  },
                  child:
                      const FrozenCard(title: "Frozen Coin ", value: "8XXX1")),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {},
                  child: const FrozenCard(
                      title: "Available Coin ", value: "8XXX1")),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {},
                  child:
                      const FrozenCard(title: "Total Coin ", value: "8XXX1")),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Buy Hiring packages as per your need ",
                style: alegreyaW700S18Black,
              )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Profile",
                          style: interW400S14Black,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Credits",
                          style: interW400S14Black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            //implement on tap
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddCreditsPage(
                                      title: 'Profile Credits',
                                    )));
                          },
                          child: const AddButton(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Pricing",
                        style: interW700S10Black,
                      ),
                      Center(
                        child: Text(
                          "₹ 199+GST/Credit",
                          style: poppinsW400S12Black,
                        ),
                      )
                    ],
                  ),
                  // const IntrinsicHeight(
                  //   child: VerticalDivider(
                  //     thickness: 2,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Post",
                          textAlign: TextAlign.start,
                          style: interW400S14Black,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Credits",
                          textAlign: TextAlign.center,
                          style: interW400S14Black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            //implement on tap
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddCreditsPage(
                                  title: "Post Credits",
                                ),
                              ),
                            );
                          },
                          child: const AddButton(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Pricing",
                        style: interW700S10Black,
                      ),
                      Center(
                        child: Text(
                          "₹ 499+GST/Credit",
                          style: poppinsW400S12Black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ])));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.black),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
        Text(
          "Add",
          style: poppinsW500S15White,
        )
      ]),
    );
  }
}

class FrozenCard extends StatelessWidget {
  final String title;
  final String value;
  const FrozenCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0),
            )
          ],
          gradient: const LinearGradient(
            colors: [Colors.black, Colors.grey],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(
                title,
                style: poppinsW500S18White,
              ),
              const SizedBox(height: 8),
              Row(children: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    "assets/icons/coin_symbol.png",
                    fit: BoxFit.contain,
                  ),
                ),
                // const SizedBox(
                //   width: 6,
                // ),
                Text(
                  value,
                  style: poppinsW500S18White,
                ),
              ]),
              const SizedBox(height: 6),
            ],
          ),
        ));
  }
}
