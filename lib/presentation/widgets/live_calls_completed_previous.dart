import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_card.dart';
import 'package:jusitfi_admin/presentation/widgets/scheduled_completed_advocate_card.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class LiveCallsCompletedPreviousVerticalTile extends StatelessWidget {
  const LiveCallsCompletedPreviousVerticalTile({Key? key}) : super(key: key);

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
                const LiveCallsCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 1550,
                    callType: "Video Call"),
                const LiveCallsCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 850,
                    callType: "Audio Call"),
                const LiveCallsCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 950,
                    callType: "Video Call"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
