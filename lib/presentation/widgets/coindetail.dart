import 'package:flutter/material.dart';

class CoinDetail extends StatelessWidget {
  const CoinDetail({super.key, required this.title, required this.detail});
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          title: const Align(
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
                    SizedBox(
                      width: 100,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: Text(
                        detail,
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
