// ignore_for_file: implementation_imports, file_names, unused_local_variable, unnecessary_null_comparison

import 'dart:convert';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Place_Order_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_view.dart';
import 'package:ecologital_assignment/Screens/observables/locator.dart';
import 'package:ecologital_assignment/Screens/observables/service/Basket_Change_Service.dart';
import 'package:ecologital_assignment/Services/Basket_Service.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:ecologital_assignment/common/Common.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BasketViewModel extends BaseViewModel {
  BasketViewArgument? args;
  BasketModel? basketModel;
  int total = 0;
  bool isFromHome = false;
  List<BasketModel>? basketList;
  late PlaceOrderModel placeOrderModel;
  bool isLoading = false;

  initialise({required BuildContext context}) async {
    args = ModalRoute.of(context)!.settings.arguments as BasketViewArgument;
    if (getIt<BasketChangeService>().basketChangeNotifier.basketList != null &&
        getIt<BasketChangeService>()
            .basketChangeNotifier
            .basketList!
            .isNotEmpty) {
      basketList = getIt<BasketChangeService>().basketChangeNotifier.basketList;
    }
    if (args != null) {
      basketList = args!.basketModel;
      isFromHome = args!.isFromHome;
    } else {
      getBasketFromStorage();
    }
    if (basketList != null && basketList!.isNotEmpty) {
      total = calculateTotal();
    }
  }

  getBasketFromStorage() async {
    var data = await Common.getBasket();
    var basketJson = jsonDecode(data);
    // basketModel = BasketModel.fromJson(basketJson);
    for (var item in basketJson) {
      var res = BasketModel.fromJson(item);
      basketList!.add(res);
    }
  }

  removeBasketFromStorage() async {
    await Common.removeBasket();
  }

  void placeOrder(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    var data = await BasketService.placeOrder();
    placeOrderModel = data;
    int count = 0;
    isLoading = false;
    getIt<BasketChangeService>().basketChangeNotifier.basketList = [];
    removeBasketFromStorage();
    notifyListeners();

    if (placeOrderModel.status) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextThemes.H2itle("Success", Themes.keyDark, 1),
            content: TextThemes.boldtitle(
                placeOrderModel.message, Themes.keyDark, 2),
            actions: [
              TextButton(
                child: TextThemes.subtitle("Ok", Themes.keyDark, 1),
                onPressed: () {
                  Navigator.of(context)
                      .popUntil((_) => count++ >= (isFromHome ? 2 : 3));
                  getIt<BasketChangeService>().basketChangeNotifier.basketList =
                      [];
                  notifyListeners();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void deleteItem(BuildContext context, {required int index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextThemes.H2itle("Warning", Themes.keyDark, 1),
          content: TextThemes.boldtitle(
              "Do you want to delete ${basketList![index].name}?",
              Themes.keyDark,
              2),
          actions: [
            TextButton(
              child: TextThemes.subtitle("Yes", Themes.keyDark, 1),
              onPressed: () {
                basketList!.removeAt(index);
                Navigator.pop(context);
                if (basketList!.isEmpty) {
                  total = 0;
                }
                notifyListeners();
              },
            ),
            TextButton(
              child: TextThemes.subtitle("No", Themes.keyDark, 1),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  int calculateTotal() {
    int tot = 0;
    for (var i in basketList!) {
      if (i.basket_unitType!.price != 0) {
        tot += i.basket_unitType!.price * i.quantity;
      } else {
        tot += i.price * i.quantity;
      }
    }
    return tot;
  }

  void editItem(BuildContext context, {required int index}) {
    Navigator.pushNamed(context, ItemView.routeName,
        arguments: ItemViewArgument(
            isFromBasket: true, itemId: basketList![index].id,quantity: basketList![index].quantity));
  }
}
