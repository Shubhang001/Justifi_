import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

Future<Object?> showCallDetails(BuildContext context) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      actions: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: kdesignButtonText,
                      ),
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35))),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    child: Center(
                      child: Text(
                        'Call',
                        style: kdesignButtonText,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: kprimaryTextColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    height: 50,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      backgroundColor: Colors.black,
      title: Center(
        child: Text(
          'Call Details',
          style: kCallTitle,
        ),
      ),
      content: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(7)),
                child: Image.asset(
                  'assets/images/advocate_img.png',
                  fit: BoxFit.fill,
                ),
                width: 100,
                height: 90,
              ),
              Text('Priya Sharma', style: kCallName),
              Table(
                border: TableBorder.all(width: 1.0, color: Colors.white),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Mode',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Phone Call',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Price /15mins',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              '200Rs',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Location',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Mumbai',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Current Balance',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              '350Rs',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              'Call Possible for',
                              style: kCallQn,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              '15 mins',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    ),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 1 * anim1.value, sigmaY: 1 * anim1.value),
      child: FadeTransition(
        child: child,
        opacity: anim1,
      ),
    ),
    context: context,
  );
}
