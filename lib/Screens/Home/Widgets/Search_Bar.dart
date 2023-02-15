// ignore_for_file: file_names, avoid_renaming_method_parameters

import 'package:ecologital_assignment/Screens/Home/Home_View_Model.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SearchBox extends ViewModelWidget<HomeViewModel>
    implements PreferredSizeWidget {
  const SearchBox({Key? key})
      : super(
          key: key,
          reactive: false,
        );
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      color: Themes.keyLight,
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          // autofocus: true,
          focusNode: model.searchFocusNode,
          onTap: () {},
          readOnly: false,
          controller: model.searchControler,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  "assets/svg/search.svg",
                  height: 15.0,
                  color: Themes.shadowDark,
                ),
              ),
              hintText: model.searchBoxHintText,
              hintStyle: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              fillColor: Themes.shadowLight),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
