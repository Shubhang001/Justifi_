import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/presentation/screens/homepage.dart';
import 'package:jusitfi_admin/presentation/widgets/advocate_extended_dark.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';
import '../widgets/advocate_card_extended.dart';
import '../widgets/smallButton.dart';

Future<Object?> floatCases8(
  BuildContext context,
) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black38,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      backgroundColor: Colors.white,
      content: SizedBox(
          width: 500,
          height: 600,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You are hiring',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'You have successfully hired advocate',
                  style: kFilterValue,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const AdvocateCardExtendedDark(
                name: 'Priya Sharma',
                image: 'assets/images/advocate_img.png',
                education:
                    'LL.B - Delhi University\nCyber Law - Indian Law Institue',
                distance: 10,
                rating: 3.5,
                clients: 100,
                cases: 100,
                experience: 15,
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/check_mark.png',
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'View Status',
                            style: kCallAns,
                          )),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'View Message',
                              style: kCallAns,
                            ),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              )
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
