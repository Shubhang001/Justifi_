import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_canceled_card.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class LiveCallsCancelledPreviousVerticalTile extends StatelessWidget {
  const LiveCallsCancelledPreviousVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "23 Jan | 2023 | Saturday",
                      style: kCallQnBlack,
                    )
                  ],
                ),
                const LiveCallsCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 0,
                    callType: "Video Call"),
                const LiveCallsCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 4,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 0,
                    callType: "Audio Call"),
                const LiveCallsCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 2,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 0,
                    callType: "Video Call"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
