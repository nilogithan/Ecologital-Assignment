// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchControler = TextEditingController();
  String searchBoxHintText = "Search for foods";

  initialise({required BuildContext context}) {

  }
}