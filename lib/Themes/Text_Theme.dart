import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';

class TextThemes{

  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.w600;

  static Text subtitle(text, color, maxLine, {textAlign, fontWeight = bold, bool crossText = false, String fontFamily = ""}) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? textAlign,
        maxLines: maxLine,
        style: TextStyle(
            //fontFamily: fontFamily != "" ? fontFamily : Themes.brandFont,
            fontSize: 14,
            fontWeight: fontWeight,
            letterSpacing: 0.15,
            color: color,
            decoration: crossText ? TextDecoration.lineThrough : TextDecoration.none));
  }
}