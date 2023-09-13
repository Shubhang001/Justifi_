import 'package:flutter/material.dart';

class CoinDetail extends StatelessWidget {
  const CoinDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 200,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Coins Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Frozen Coins :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 130,
                      child: Text(
                        "Coins used to schedule Calls ",
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
