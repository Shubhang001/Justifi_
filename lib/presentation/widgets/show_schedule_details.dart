import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/presentation/screens/assign_work.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/textstyles.dart';

Future<Object?> showScheduleDetails(BuildContext context, String date,int duration, String startTime, String endTime) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      contentPadding: EdgeInsets.zero,
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
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
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
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>FinishedPage(text: 'Your meeting request has been submitted', nextPage: HomePage(), nextPageName: 'View Status'))),
                  child: Container(
                    child: Center(
                      child: Text(
                        'Confirm',
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
      backgroundColor: Colors.white,
      title: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Scheduling Session',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ),
      content: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/advocate_img.png')),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Priya Sharma',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Table(
                border: TableBorder.all(width: 1.0, color: Colors.black),
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
                              style: kCallQn,
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
                              style: kCallQn,
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
                              style: kCallQn,
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
                              'Date',
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
                              date,
                              style: kCallQn,
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
                              'Duration',
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
                              '$duration mins',
                              style: kCallQn,
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
                              'Start Time',
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
                              startTime,
                              style: kCallQn,
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
                              'End Time',
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
                              endTime,
                              style: kCallQn,
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
