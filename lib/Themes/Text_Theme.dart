// ignore_for_file: file_names, non_constant_identifier_names

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

  static Text boldtitle(text, color, maxLine, {textAlign, fontWeight = bold, bool crossText = false, String fontFamily = ""}) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? textAlign,
        maxLines: maxLine,
        style: TextStyle(
            //fontFamily: fontFamily != "" ? fontFamily : Themes.brandFont,
            fontSize: 16,
            fontWeight: fontWeight,
            letterSpacing: 0.15,
            color: color,
            decoration: crossText ? TextDecoration.lineThrough : TextDecoration.none));
  }

  static Text H2itle(text, color, maxLine, {textAlign, fontWeight = bold, bool crossText = false, String fontFamily = ""}) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign ?? textAlign,
        maxLines: maxLine,
        style: TextStyle(
            //fontFamily: fontFamily != "" ? fontFamily : Themes.brandFont,
            fontSize: 22,
            fontWeight: fontWeight,
            letterSpacing: 0.15,
            color: color,
            decoration: crossText ? TextDecoration.lineThrough : TextDecoration.none));
  }
}