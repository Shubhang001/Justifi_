import 'package:flutter/material.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

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
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostCancelledCard(
                  fees: '1024',
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 15,
                  feeType: "One Time",
                  viewApplication: true,
                  courtName: "Allahabad ",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostCancelledCard(
                  fees: '1024',
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 12,
                  feeType: "Per Hearing",
                  viewApplication: false,
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
                const CasePostCancelledCard(
                  fees: '1020',
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 10,
                  feeType: "One Time",
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
