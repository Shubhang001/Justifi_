import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../../utils/constants/textstyles.dart';

class MobileInputTextField extends StatelessWidget {
  const MobileInputTextField(
      {super.key,
      required this.title,
      required this.txtController,
      required this.validate});

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    double? value = double.tryParse(s);
    return value != null && value >= 0; // Allow only positive numbers
  }

  final String title;
  final TextEditingController txtController;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: RichText(
              text: TextSpan(text: title, style: GoogleFonts.poppins(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ), children: [
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: ktextFieldTitle.fontWeight,
                        fontSize: ktextFieldTitle.fontSize))
              ]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 60,
            child: TextField(
              maxLength: 10,
              keyboardType: TextInputType.phone,
              controller: txtController,
              style: kTextFieldValue,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only numbers
              ],
              decoration: InputDecoration(
                  errorText: validate &&
                          (txtController.text.length < 10 ||
                              !isNumeric(txtController.text))
                      ? 'Enter a Valid Mobile Number'
                      : null,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 2.5),
                    child: Text(
                      '+91',
                      style: kTextFieldValue,
                    ),
                  ),
                  prefixIconConstraints:
                      BoxConstraints.tight(const Size(35, 35)),
                  hintText: '9999999999',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }
}
