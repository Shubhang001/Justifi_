import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_pending_hire_card.dart';

import '../../utils/constants/textstyles.dart';

class CasePostPendingHireVerticalTile extends StatelessWidget {
  const CasePostPendingHireVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostPendingHireCard(
                  name: "Priya Sharma",
                  weeks: 4,
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 15,
                  feeType: "One Time",
                  viewApplication: true,
                  courtName:
                      'The Telecom Disputes Settlement and Appellate Tribunal (TDSAT)',
                  fees: '1000',
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostPendingHireCard(
                  name: "Priya Sharma",
                  weeks: 4,
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 12,
                  feeType: "Per Hearing",
                  viewApplication: false,
                  fees: '1500',
                  courtName: "Allahabad",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostPendingHireCard(
                  name: "Priya Sharma",
                  weeks: 4,
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 10,
                  feeType: "One Time",
                  fees: '1030',
                  viewApplication: true,
                  courtName:
                      "The Telecom Disputes Settlement and Appellate Tribunal (TDSAT)",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
