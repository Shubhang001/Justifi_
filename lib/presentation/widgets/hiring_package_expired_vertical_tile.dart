import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/hiring_package_card.dart';

class HiringPackageExpiredVerticalTile extends StatelessWidget {
  const HiringPackageExpiredVerticalTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                HiringPackageCard(
                  image: 'assets/images/hiring_image.png',
                  hiringType: "Profile Hiring",
                  active: false,
                  date: "06 Oct 2022",
                  oneTimeCredited: "3",
                  oneTimeUsed: "3",
                  monthlyCredited: "",
                  monthlyUsed: "",
                  quarterlyCredited: "",
                  quarterlyUsed: "",
                  yearlyCredited: "",
                  yearlyUsed: "",
                ),
                HiringPackageCard(
                  image: 'assets/images/hiring_image.png',
                  hiringType: "Post Hiring",
                  active: false,
                  date: "06 Oct 2022",
                  oneTimeCredited: "",
                  oneTimeUsed: "",
                  monthlyCredited: "",
                  monthlyUsed: "",
                  quarterlyCredited: "",
                  quarterlyUsed: "",
                  yearlyCredited: "",
                  yearlyUsed: "",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
