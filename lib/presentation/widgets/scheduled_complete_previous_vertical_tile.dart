import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/scheduled_completed_advocate_card.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

class ScheduleCompletedPreviousVerticalTile extends StatelessWidget {
  const ScheduleCompletedPreviousVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text("10th January, 2023", style: poppinsW600S16Black),
                const ScheduledCompletedAdvocateCard(
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
                  postingDate: "27th Nov, 2022",
                ),
                Text("15th January, 2023", style: poppinsW600S16Black),
                const ScheduledCompletedAdvocateCard(
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
                  postingDate: "27th Nov, 2022",
                ),
                Text("17th January, 2023", style: poppinsW600S16Black),
                const ScheduledCompletedAdvocateCard(
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
                  postingDate: "27th Nov, 2022",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
