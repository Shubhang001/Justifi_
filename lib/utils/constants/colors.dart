import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color kprimaryTextColor = HexColor('#787878');
Color kbuttonColor = HexColor('#434343');
Color kobdescriptionColor = HexColor('#323232');
Color kobbuttonColor = HexColor('#3E3E3E');
Color kmainButtonColor = HexColor('#9C9C9C');
Color kinactive = HexColor('#3E3E3E75');
Color ksearchColor = HexColor('#6D6D6D');
Color kSearchBarColor = HexColor('#D9D9D9');
Color kSelectedColor = HexColor('#F2796B');
Color kSchedulebuttonColor = HexColor('#8F8F8F');
Color kPrimaryBlackColor = HexColor('#000000');
Color kPendingcolor = HexColor('#DFB200');
Color kHiredColor = HexColor('#0C9B00');
Color kCanceledColor = HexColor('#F11515');

