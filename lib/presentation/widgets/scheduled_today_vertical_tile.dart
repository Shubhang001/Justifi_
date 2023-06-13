import 'package:flutter/material.dart';

import 'package:jusitfi_admin/presentation/widgets/scheduled_advocateCard.dart';

class ScheduledTodayVerticalTile extends StatelessWidget {
  const ScheduledTodayVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ScheduledAdvocateCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    paidAmount: 700,
                    postingDate: "27th Nov, 2022"),
                ScheduledAdvocateCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    paidAmount: 700,
                    postingDate: "27th Nov, 2022"),
                ScheduledAdvocateCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    location: "Mumbai",
                    rating: 5,
                    date: "06 Oct 2022",
                    time: "5:00 pm",
                    duration: 60,
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    paidAmount: 700,
                    postingDate: "27th Nov, 2022"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
