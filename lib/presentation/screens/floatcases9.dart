import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases5.dart';
import 'package:jusitfi_admin/presentation/screens/floatcases8.dart';
import '../../utils/constants/textstyles.dart';
import '../widgets/advocate_card_extended.dart';
import '../widgets/smallButton.dart';

Future<Object?> floatCases9(
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
          height: 400,
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
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const AdvocateCardExtended(
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
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22)),
                ),
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        floatCases8(context);
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Hire',
                            style: kMainCategory,
                          ),
                        ),
                      ),
                    ),
                    smallButton(nextPage: const FloatCases5(), name: 'Cancel'),
                  ],
                ),
              ))
            ],
          )),
    ),
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 1 * anim1.value, sigmaY: 1 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: context,
  );
}
