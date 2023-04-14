import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/approval_pending_advocate_card.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_pending_apply_card.dart';

class CasePostPendingApplyVerticalTile extends StatelessWidget {
  const CasePostPendingApplyVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                CasePostPendingApplyCard(
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
                CasePostPendingApplyCard(
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
                CasePostPendingApplyCard(
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
