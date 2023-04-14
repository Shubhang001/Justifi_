import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_pending_hire_card.dart';

import 'case_post_cancelled_card.dart';

class CasePostCancelledVerticalTile extends StatelessWidget {
  const CasePostCancelledVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                CasePostCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    caseTitle: "ABCDFTGH",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    postingDate: "27th Nov, 2022",
                    noOfApplication: 15,
                    feeType: "One Time",
                    viewApplication: true),
                CasePostCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    caseTitle: "ABCDERGHI",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    postingDate: "27th Nov, 2022",
                    noOfApplication: 12,
                    feeType: "Per Hearing",
                    viewApplication: false),
                CasePostCancelledCard(
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    postingDate: "27th Nov, 2022",
                    noOfApplication: 10,
                    feeType: "One Time",
                    viewApplication: true),
              ],
            ),
          ),
        )
      ],
    );
  }
}
