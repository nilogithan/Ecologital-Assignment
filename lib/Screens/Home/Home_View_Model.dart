// ignore_for_file: file_names, non_constant_identifier_names, unused_element

import 'package:ecologital_assignment/Models/Cateegory_Model.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View_Arguments.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchControler = TextEditingController();
  String searchBoxHintText = "Search for foods";
  HoeViewArguments? args;
  List<CategoryModel> categoryList = [];
  List<ItemModel>? itemList = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  
    // scrollController.addListener() {
    //   if (scrollController.position.maxScrollExtent ==
    //       scrollController.position.pixels) {
    //     if (!isLoading) {
    //       isLoading = !isLoading;
    //       // Perform event when user reach at the end of list (e.g. do Api call)
    //     }
    //   }}

  initialise({required BuildContext context}) async {
    args = ModalRoute.of(context)!.settings.arguments as HoeViewArguments;
    
    if (args != null) {
      categoryList = args!.categoryList!;
      itemList = args!.itemList!;
    }
  }

  NavigateToItemView(BuildContext context, ItemModel item) {
    Navigator.pushNamed(context, ItemView.routeName,
        arguments: ItemViewArgument(item: item));
  }
}
