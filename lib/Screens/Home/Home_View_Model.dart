// ignore_for_file: file_names, non_constant_identifier_names

import 'package:ecologital_assignment/Screens/Item/Item_view.dart';
import 'package:ecologital_assignment/Services/Http_Service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchControler = TextEditingController();
  String searchBoxHintText = "Search for foods";

  String desc = "Duis proident labore aliquip eiusmod proident exercitation nulla esse esse labore consequat consequat. Enim sit minim eiusmod ea consectetur pariatur aute occaecat aute consectetur et ea incididunt laborum. Ullamco proident id est do tempor. Nostrud aute ex officia ipsum exercitation incididunt tempor deserunt ut incididunt aliqua. Aliqua velit duis exercitation deserunt nisi minim voluptate eiusmod aute pariatur culpa qui.";

  initialise({required BuildContext context}) async{
    var data = await get("/categories");
    debugPrint(data.toString());
  }

  NavigateToItemView(BuildContext context) {
    Navigator.pushNamed(context, ItemView.routeName);
  }
}