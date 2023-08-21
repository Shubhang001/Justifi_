import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_hired_card.dart';

import '../../utils/constants/textstyles.dart';

class CasePostHiredVerticalTile extends StatelessWidget {
  const CasePostHiredVerticalTile({Key? key}) : super(key: key);

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
                const CasePostHiredCard(
                  fees: '1002',
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "ABCDFTGH",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 15,
                  feeType: "One Time",
                  viewApplication: true,
                  courtName:
                      "The Telecom Disputes Settlement and Appellate Tribunal (TDSAT)",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostHiredCard(
                    fees: '1002',
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    caseTitle: "ABCDERGHI",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    postingDate: "27th Nov, 2022",
                    noOfApplication: 12,
                    feeType: "Per Hearing",
                    viewApplication: false,
                    courtName: "Allahabad"),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostHiredCard(
                    fees: '1002',
                    name: "Priya Sharma",
                    image: 'assets/images/advocate_img.png',
                    caseTitle: "ABC",
                    courtType: "High Court",
                    caseCategory: "xyz",
                    caseSubCategory: "xyz",
                    postingDate: "27th Nov, 2022",
                    noOfApplication: 10,
                    feeType: "One Time",
                    viewApplication: true,
                    courtName:
                        "The Telecom Disputes Settlement and Appellate Tribunal (TDSAT)"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
