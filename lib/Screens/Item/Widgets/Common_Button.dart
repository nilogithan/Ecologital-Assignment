// ignore_for_file: file_names

import 'package:ecologital_assignment/Screens/Item/Item_View_Model.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CommonBottomButtonLayout extends ViewModelWidget<ItemViewModel> {
  final String buttontext;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final int? subTotal;

  const CommonBottomButtonLayout({required this.buttontext, required this.onTap, this.margin,this.subTotal, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ItemViewModel viewModel) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.only(left: 16.0, right: 16.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Themes.brandColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextThemes.boldtitle(
              buttontext,
              Themes.keyDark,
              1,
            ),
            TextThemes.boldtitle(
              " (Rs $subTotal)",
              Themes.keyDark,
              1,
            ),
          ],
        ),
      ),
    );
  }
}
