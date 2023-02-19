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
import 'package:ecologital_assignment/Screens/observables/locator.dart';
import 'package:ecologital_assignment/Screens/observables/service/Basket_Change_Service.dart';
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
  bool isMaxLoaded = false;
  bool isPaginationLoading = false;
  bool isAppInit = true;

  ScrollController get scrollController => _scrollController;

  initialise({required BuildContext context}) async {
    args = ModalRoute.of(context)!.settings.arguments as HoeViewArguments;
    // isAppInit = false;
    getIt<BasketChangeService>().basketChangeNotifier.isAppInitSet(isAppInit);
    if (args != null) {
      categoryList = args!.categoryList!;
      itemList = args!.itemList!;
      backupList = itemList!;
      basketList = args!.basketModel;
      getIt<BasketChangeService>().basketChangeNotifier.basketList = basketList;
      getIt<BasketChangeService>().basketChangeNotifier.setItemList(itemList);
    }
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page += 1;
        if (!isMaxLoaded) {
          loadMore(page);
        }
      }
    });
  }

  NavigateToItemView(BuildContext context, ItemModel item) {
    Navigator.pushNamed(context, ItemView.routeName,
            arguments: ItemViewArgument(item: item, basketList: basketList))
        .then((value) => notifyListeners());
  }

  Search({required BuildContext context}) {
    showSearch(context: context, delegate: ItemSearch(itemList: itemList!));
  }

  categorySelect(BuildContext context, int index) {
    int catPage = 0;
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
      if (itemList!.length < 7) {
        catPage += 1;
        loadMore(catPage);
      }
    }

    notifyListeners();
  }

  loadMore(int page) async {
    int pageNo = 1;
    isPaginationLoading = true;
    notifyListeners();
    if (page != null) {
      pageNo = page;
    }
    try {
      var items = await ItemService.getAllItems(pageNo,
          categoryId: selectedCatIndex != null
              ? categoryList[selectedCatIndex!].id
              : "");
      List<String> itemIds = [];
      for (var j in itemList!) {
            itemIds.add(j.id);
          }
      if (items != null && items.isNotEmpty) {
        for (var i in items) {
          if (!itemIds.contains(i.id)) {
              itemList!.add(i);
            }
        }
      } else {
        isMaxLoaded = true;
      }
    } catch (ex) {
      throw ex;
    }
    isPaginationLoading = false;
    notifyListeners();
    getIt<BasketChangeService>().basketChangeNotifier.setItemList(itemList);
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
                  BasketViewArgument(basketModel: basketList, isFromHome: true))
          .then((value) => notifyListeners());
    }
  }
}
