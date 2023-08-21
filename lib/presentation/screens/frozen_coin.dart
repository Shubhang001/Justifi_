import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class FrozenCoinBalanceScreen extends StatelessWidget {
  const FrozenCoinBalanceScreen({super.key});

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
        child: Column(
          children: [
            Expanded(
              child: GenerateView(
                count: 2,
                widgetList: [
                  [
                    TransactionType(
                      msgHolder: "Voice Call",
                      suffixMsg: "100 \nmins",
                      assetName: "voice_call.png",
                    ),
                    TransactionType(
                      msgHolder: "Voice Call",
                      suffixMsg: "100 \nmins",
                      assetName: "video_call.png",
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
                        "coin.png",
                        "Coins Frozen",
                        "12345    ",
                      ],
                    ],
                  ),
                  ImageHolder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenerateView extends StatelessWidget {
  const GenerateView({
    super.key,
    required this.widgetList,
    required this.count,
  });

  final List widgetList;
  final int count;

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
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Transaction id : 1198hu13hu913",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgetList[0][index],
                        widgetList[1],
                        widgetList[2],
                      ],
                    ),
                  )
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

const whiteText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

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
    return double.tryParse(s) != null;
  }
}
