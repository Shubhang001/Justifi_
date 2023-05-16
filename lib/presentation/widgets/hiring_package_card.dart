import 'package:flutter/material.dart';

import 'package:jusitfi_admin/utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

class HiringPackageCard extends StatelessWidget {
  const HiringPackageCard({
    super.key,
    required this.image,
    required this.date,
    required this.hiringType,
    required this.active,
    required this.oneTimeCredited,
    required this.oneTimeUsed,
    required this.monthlyCredited,
    required this.monthlyUsed,
    required this.quarterlyCredited,
    required this.quarterlyUsed,
    required this.yearlyCredited,
    required this.yearlyUsed,
  });

  final String image;
  final String date;
  final String hiringType;
  final bool active;
  final String oneTimeCredited;
  final String oneTimeUsed;
  final String monthlyCredited;
  final String monthlyUsed;
  final String quarterlyCredited;
  final String quarterlyUsed;
  final String yearlyCredited;
  final String yearlyUsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: hiringCardBgColor),
          child: Row(
            children: [
              Container(
                  height: 220,
                  width: 164,
                  child: Image.asset(image.toString())),
              Column(
                children: [
                  Row(
                    children: [
                      hiringType == "Profile Hiring"
                          ? Icon(Icons.person)
                          : Container(
                              height: 18,
                              width: 14,
                              child: Image.asset("assets/icons/group_icon.png"),
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        hiringType.toString(),
                        style: alegreyaW700S18Black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 21,
                        width: 25,
                        child: Image.asset("assets/icons/up_down_icon.png"),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Text(
                        active ? "Active" : "Expired",
                        style: alegreyaW700S18Black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //profileType && logo in row
                  // Active status in row
                  //table

                  Center(
                      child: Column(children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Table(
                        defaultColumnWidth: FixedColumnWidth(50),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            borderRadius: BorderRadius.circular(2),
                            width: 2),
                        children: [
                          TableRow(children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Profile ', style: interW700S10Black),
                                  Text('Hiring ', style: interW700S10Black)
                                ]),
                            Center(
                                child: Text('Credited ',
                                    style: interW700S10Black)),
                            Center(
                                child: Text('Used ', style: interW700S10Black))
                          ]),
                          TableRow(children: [
                            Center(
                              child: Text('1 time ', style: interW700S10Black),
                            ),
                            Center(
                                child: Text(oneTimeCredited.toString(),
                                    style: interW700S10Black)),
                            Center(
                              child: Text(oneTimeUsed.toString(),
                                  style: interW700S10Black),
                            )
                          ]),
                          TableRow(children: [
                            Center(
                                child:
                                    Text('Monthly ', style: interW700S10Black)),
                            Center(
                              child: Text(monthlyCredited.toString(),
                                  style: interW700S10Black),
                            ),
                            Center(
                              child: Text(monthlyUsed.toString(),
                                  style: interW700S10Black),
                            )
                          ]),
                          TableRow(children: [
                            Center(
                                child: Text('Quarterly ',
                                    style: interW700S10Black)),
                            Center(
                                child: Text(quarterlyCredited.toString(),
                                    style: interW700S10Black)),
                            Center(
                                child: Text(quarterlyUsed.toString(),
                                    style: interW700S10Black)),
                          ]),
                          TableRow(children: [
                            Center(
                              child: Text('Yearly ', style: interW700S10Black),
                            ),
                            Center(
                                child: Text(yearlyCredited.toString(),
                                    style: interW700S10Black)),
                            Center(
                                child: Text(yearlyUsed.toString(),
                                    style: interW700S10Black)),
                          ]),
                        ],
                      ),
                    ),
                  ])),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date.toString(),
                        style: poppinsW500S10Grey,
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
