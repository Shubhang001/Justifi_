import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/case_post_pending_apply_card.dart';

import '../../utils/constants/textstyles.dart';

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
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostPendingApplyCard(
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 15,
                  feeType: "Per Hearing",
                  viewApplication: false,
                  courtName: "Allahabad",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostPendingApplyCard(
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 15,
                  feeType: "Per Hearing",
                  viewApplication: false,
                  courtName: "Allahabad",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
                const CasePostPendingApplyCard(
                  name: "Priya Sharma",
                  image: 'assets/images/advocate_img.png',
                  caseTitle: "Landlord not giving Refundable Money ",
                  courtType: "High Court",
                  caseCategory: "xyz",
                  caseSubCategory: "xyz",
                  postingDate: "27th Nov, 2022",
                  noOfApplication: 15,
                  feeType: "Per Hearing",
                  viewApplication: false,
                  courtName: "Allahabad",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Post Date: 10th January, 2023",
                      style: poppinsW400S9Black),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }
}
