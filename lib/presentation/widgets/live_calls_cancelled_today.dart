import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/live_calls_canceled_card.dart';

class LiveCallsCancelledTodayVerticalTile extends StatelessWidget {
  const LiveCallsCancelledTodayVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                LiveCallsCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 0,
                    callType: "Video Call"),
                LiveCallsCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 4,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    paidAmount: 0,
                    callType: "Audio Call"),
                LiveCallsCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 3,
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
