import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/utils/constants/colors.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

const whiteText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle tabBarFont = GoogleFonts.poppins(
  fontSize: 10,
);

class WalletTransactionPage extends StatefulWidget {
  const WalletTransactionPage({super.key});

  @override
  State<WalletTransactionPage> createState() => _WalletTransactionPageState();
}

class _WalletTransactionPageState extends State<WalletTransactionPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 2,
    );
  }

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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.black),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: TabBar(
                indicator: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelColor: Colors.white,
                labelStyle: tabBarFont,
                unselectedLabelStyle: tabBarFont,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  // Tab(
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 2,
                  //       vertical: 3,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         width: 2,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     child: const Text(
                  //       "Hiring Credit",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                  Tab(
                    child: Text(
                      "Coin Add",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Coin Paid",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // Hiring Credit Section
                  //HiringCreditSection(),

                  // Coin add Section (Exactly Same as the previous Section except the first column)

                  CoinAddSection(),

                  // Internal Section
                  QuickConnect(),
                  //InternalSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HiringCreditSection extends StatelessWidget {
  const HiringCreditSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const GenerateView(
      caseConnect: false,
      widgetList: [
        [
          TransactionType(
            msgHolder: "Profile Credit",
            suffixMsg: "008",
            assetName: "contact.jpg",
          ),
          TransactionType(
            msgHolder: "Post Credit",
            suffixMsg: "-01",
            assetName: "group.jpg",
          ),
        ],
        StatusReflectColumn(
          list: [
            [
              "dash.png",
              "Pay Status",
              "Success",
            ],
            [
              "credit.jpg",
              "Pay Mode",
              "UPI       ",
            ],
            [
              "money.png",
              "Pay Amount",
              "₹12345",
            ],
          ],
        ),
        PaymentTransferMode(),
      ],
      count: 2,
    );
  }
}

class CoinAddSection extends StatelessWidget {
  const CoinAddSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenerateView(
      caseConnect: false,
      widgetList: [
        [
          TransactionType(
            msgHolder: "Coin Credit",
            suffixMsg: "1085",
            assetName: "coin.png",
          ),
          TransactionType(
            msgHolder: "Coin Credit",
            suffixMsg: "1085",
            assetName: "coin.png",
          ),
          TransactionType(
            msgHolder: "Coin Credit",
            suffixMsg: "1085",
            assetName: "coin.png",
          ),
        ],
        StatusReflectColumn(
          list: [
            [
              "dash.png",
              "Status",
              "Success",
            ],
            [
              "credit.jpg",
              "Pay Mode",
              "UPI     ",
            ],
            [
              "money.png",
              "pay Amount",
              "₹12345",
            ],
          ],
        ),
        PaymentTransferMode(),
      ],
      count: 3,
    );
  }
}

class InternalSection extends StatefulWidget {
  const InternalSection({super.key});

  @override
  State<InternalSection> createState() => _InternalSectionState();
}

class _InternalSectionState extends State<InternalSection>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TabBar(
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.black,
            ),
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            labelStyle: tabBarFont,
            unselectedLabelStyle: tabBarFont,
            tabs: [
              Tab(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  child: const Text(
                    "Internal Coin Paid",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  child: const Text(
                    "Case  Connect",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              QuickConnect(),
              CaseConnect(),
            ],
          ),
        )
      ],
    );
  }
}

class QuickConnect extends StatelessWidget {
  const QuickConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenerateView(
      caseConnect: false,
      count: 2,
      widgetList: [
        [
          TransactionType(
            msgHolder: "Voice Call",
            suffixMsg: "100 \nmins",
            assetName: "voice_call.png",
          ),
          TransactionType(
            msgHolder: "Video Call",
            suffixMsg: "100 \nmins",
            assetName: "video_call.png",
          ),
        ],
        StatusReflectColumn(
          list: [
            [
              "dash.png",
              "Payment status",
              "Success",
            ],
            [
              "connect.png",
              "Connect Type",
              "Live             ",
            ],
            [
              "coin.png",
              "Payment Coins",
              "12345    ",
            ],
          ],
        ),
        ImageHolder(),
      ],
    );
  }
}

class CaseConnect extends StatelessWidget {
  const CaseConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenerateView(
      caseConnect: true,
      count: 2,
      widgetList: [
        [
          TransactionType(
            msgHolder: "Post Credit",
            suffixMsg: "-01",
            assetName: "group.jpg",
          ),
          TransactionType(
            msgHolder: "Profile Credit",
            suffixMsg: "-01",
            assetName: "contact.jpg",
          ),
        ],
        StatusReflectColumn(
          list: [
            [
              "dash.png",
              "Status",
              "Failed",
            ],
            [
              "credit.jpg",
              "Credit Left",
              "5      ",
            ],
          ],
        ),
        ImageHolder(),
      ],
    );
  }
}

// All the widgets start from here

// GenerateView generates every Expanded cards
class GenerateView extends StatelessWidget {
  const GenerateView(
      {super.key,
      required this.widgetList,
      required this.count,
      required this.caseConnect});

  final List widgetList;
  final int count;
  final bool caseConnect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Date widget
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10, right: 10),
              alignment: Alignment.centerRight,
              child: const Text(
                "12/10/2023 | 15:30",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 30,
                left: 2,
                right: 2,
              ),
              padding: const EdgeInsets.only(
                top: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  caseConnect
                      ? Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Case Title",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Transaction id : 1198hu13hu913",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widgetList[0][index],
                      widgetList[1],
                      widgetList[0][index].msgHolder == 'Post Credit'
                          ? SizedBox()
                          : widgetList[2],
                    ],
                  ),
                  caseConnect
                      ? Column(
                          children: [
                            Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Transaction id : 1198hu13hu913",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// Image Holder for Internal TabBarView
class ImageHolder extends StatelessWidget {
  const ImageHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/advocate_img.png"),
          ),
          SizedBox(height: 10),
          Text(
            "Priya Sharma",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// Horizontal Stats is the second column of every screen
class HorizontalStats extends StatelessWidget {
  const HorizontalStats({
    super.key,
    required this.statusPhrase,
    required this.status,
    required this.imageAsset,
  });

  final String imageAsset;
  final String statusPhrase;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Success Text Up Holder
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          // Icon Center holder
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/$imageAsset",
                  height: 22,
                ),
                const SizedBox(width: 10)
              ],
            ),
            Text(
              statusPhrase,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
          ],
        ),
        const SizedBox(width: 10),
        isNumeric(status)
            ? Row(
                children: [
                  Image.asset(
                    'assets/icons/coin_symbol.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ))
                ],
              )
            : Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
      ],
    );
  }

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return (double.tryParse(s) != null) && double.tryParse(s)! > 10;
  }
}

// Second Column
class StatusReflectColumn extends StatelessWidget {
  const StatusReflectColumn({super.key, required this.list});

  final List<List> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < list.length; i++)
            HorizontalStats(
              imageAsset: list[i][0],
              statusPhrase: list[i][1],
              status: list[i][2],
            ),
        ],
      ),
    );
  }
}

// It is the third column in Hiring and Coin Add
class PaymentTransferMode extends StatelessWidget {
  const PaymentTransferMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    height: 30,
                    "assets/images/razorpay.jpg",
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Razorpay",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Payment Gateway",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                height: 30,
                "assets/images/download.jpg",
              ),
              const SizedBox(height: 10),
              const Text(
                "Download Invoive",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// First Column in Every Page with minor change
class TransactionType extends StatelessWidget {
  const TransactionType({
    super.key,
    required this.msgHolder,
    required this.suffixMsg,
    required this.assetName,
  });

  final String assetName;
  final String msgHolder, suffixMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/$assetName",
          height: 30,
        ),
        const SizedBox(height: 2),
        Text(
          msgHolder,
          style: whiteText,
        ),
        const SizedBox(height: 5),
        Container(
          height: 3,
          width: 45,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        Text(
          suffixMsg,
          style: whiteText,
        )
      ],
    );
  }
}

class FrozenCoinScreen extends StatelessWidget {
  const FrozenCoinScreen({super.key});

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
      body: const SafeArea(
        child: Expanded(
          child: GenerateView(
            caseConnect: false,
            count: 2,
            widgetList: [
              [
                TransactionType(
                  msgHolder: "Voice Call",
                  suffixMsg: "100 \nmins",
                  assetName: "wallet_call.png",
                ),
                TransactionType(
                  msgHolder: "Voice Call",
                  suffixMsg: "100 \nmins",
                  assetName: "wallet_call.png",
                ),
              ],
              StatusReflectColumn(
                list: [
                  [
                    "dash.png",
                    "Payment status",
                    "Frozen",
                  ],
                  [
                    "connect.png",
                    "Connect Type",
                    "Scheduled          ",
                  ],
                  [
                    "money.png",
                    "Coins Frozen",
                    "12345    ",
                  ],
                ],
              ),
              ImageHolder(),
            ],
          ),
        ),
      ),
    );
  }
}
