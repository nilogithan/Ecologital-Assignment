// ignore_for_file: implementation_imports, file_names, unused_local_variable, unnecessary_null_comparison

import 'dart:convert';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Place_Order_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Argument.dart';
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
  bool isLoading= false;

  initialise({required BuildContext context}) async {
    args = ModalRoute.of(context)!.settings.arguments as BasketViewArgument;
    if (args != null) {
      basketList = args!.basketModel;
      isFromHome = args!.isFromHome;
    } else {
      getBasketFromStorage();
    }
    for (var item in basketList!) {
      if (item.basket_unitType != null && item.basket_unitType!.price > 0) {
        total += item.basket_unitType!.price * item.quantity;
      } else {
        total += item.price * item.quantity;
      }
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
                  removeBasketFromStorage();
                  Navigator.of(context).popUntil((_) => count++ >= (isFromHome? 2 : 3));
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
              onPressed: () => basketList!.removeAt(index),
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

  void editItem({required int index}) {}
}
