import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:jusitfi_admin/utils/constants/textstyles.dart';

Future<Object?> showNotes(
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
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Notes',
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
                'Figma ipsum Rectangle component piale duplicate ellipse library union. psum outline export plugin flows create list layout vericalrototype.',
                style: kFilterValue,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
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
