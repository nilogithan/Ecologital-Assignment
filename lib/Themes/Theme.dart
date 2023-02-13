// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Themes{
   static Color shadowColor = const Color(0xFFB7B7B7).withOpacity(.16);

  static Color keyLight = HexColor('#FFFFFF'); 
  static Color keyDark = HexColor('#2E2E2E');

  static Color shadowDark = HexColor('#D6D6D6');
  static Color shadowLight = HexColor('#F7F7F7');
  static Color shadwoAsh = HexColor('#708090');
}

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
