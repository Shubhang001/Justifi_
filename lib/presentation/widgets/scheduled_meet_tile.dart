import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ScheduledMeetTile extends StatelessWidget {
  const ScheduledMeetTile(
      {super.key,
      required this.image,
      required this.name,
      this.isDark = false,
      this.isTransparentBackground = true});
  final String image;
  final String name;
  final bool isTransparentBackground;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isTransparentBackground ? null : Colors.black,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Image.asset(
            height: 60,
            width: 60,
            image,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.openSans(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
