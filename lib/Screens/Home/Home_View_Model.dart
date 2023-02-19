// ignore_for_file: file_names, non_constant_identifier_names, unused_element, use_rethrow_when_possible, unnecessary_null_comparison, avoid_single_cascade_in_expression_statements

import 'dart:io';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Cateegory_Model.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View_Arguments.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Item_Search.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_view.dart';
import 'package:ecologital_assignment/Services/Item_Service.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchControler = TextEditingController();
  String searchBoxHintText = "Search for foods";
  HoeViewArguments? args;
  List<CategoryModel> categoryList = [];
  List<ItemModel>? itemList = [];
  late ScrollController _scrollController;
  bool isLoading = false;
  int? selectedCatIndex;
  List<ItemModel>? backupList = [];
  bool isCatSelect = false;
  int flag = 0;
  bool hasNextPage = true;
  bool isLoadMore = false;
  int page = 1;
  BasketModel? basketModel;
  List<BasketModel>? basketList;

  ScrollController get scrollController => _scrollController;

  initialise({required BuildContext context}) async {
    args = ModalRoute.of(context)!.settings.arguments as HoeViewArguments;

    if (args != null) {
      categoryList = args!.categoryList!;
      itemList = args!.itemList!;
      backupList = itemList!;
      basketList = args!.basketModel;
    }
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Future.delayed(Duration.zero).then((value) {
        //    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

        // });
        loadMore();
      }
    });
  }

  NavigateToItemView(BuildContext context, ItemModel item) {
    Navigator.pushNamed(context, ItemView.routeName,
        arguments: ItemViewArgument(item: item,basketList: basketList));
  }

  Search({required BuildContext context}) {
    showSearch(context: context, delegate: ItemSearch(itemList: itemList!));
  }

  categorySelect(BuildContext context, int index) {
    if (selectedCatIndex != null && index == selectedCatIndex && flag == 0) {
      flag = 1;
      isCatSelect = false;
      itemList = backupList;
    } else {
      isCatSelect = true;
      flag = 0;
      selectedCatIndex = index;
      List<ItemModel> tempItemList = [];
      if (backupList!.isEmpty) {
        backupList = itemList!;
      }
      for (int i = 0; i < backupList!.length; i++) {
        if (backupList![i].categoryId == categoryList[index].id) {
          tempItemList.add(backupList![i]);
        }
      }
      itemList = tempItemList;
    }

    notifyListeners();
  }

  loadMore() async {
    page += 1;
    try {
      var items = await ItemService.getAllItems(page);
      if (items != null && items.isNotEmpty) {
        itemList!.addAll(items);
      }
    } catch (ex) {
      throw ex;
    }
  }

  Future<bool> onWillPop(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextThemes.H2itle("Warning", Themes.keyDark, 1),
          content:
              TextThemes.boldtitle("Do you want to exit?", Themes.keyDark, 1),
          actions: [
            TextButton(
              child: TextThemes.subtitle("Yes", Themes.keyDark, 1),
              onPressed: () => exit(0),
            ),
            TextButton(
              child: TextThemes.subtitle("No", Themes.keyDark, 1),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
    return false;
  }

  NavigateToBasket({required BuildContext context}) {
    if (basketList != null && basketList!.isNotEmpty) {
      Navigator.pushNamed(context, BasketView.routeName,
          arguments:
              BasketViewArgument(basketModel: basketList, isFromHome: true));
    }
  }
}
