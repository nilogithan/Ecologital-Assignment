// ignore_for_file: implementation_imports, file_names, unused_local_variable

import 'dart:convert';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Argument.dart';
import 'package:ecologital_assignment/common/Common.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BasketViewModel extends BaseViewModel {
  BasketViewArgument? args;
  BasketModel? basketModel;
  int? total;
  bool isFromHome = false;

  initialise({required BuildContext context}) async {
    args = ModalRoute.of(context)!.settings.arguments as BasketViewArgument;
    if (args != null) {
      basketModel = args!.basketModel;
      isFromHome = args!.isFromHome;
    } else {
      getBasketFromStorage();
    }
    total = basketModel!.subTotal;
  }

  getBasketFromStorage() async {
    var data = await Common.getBasket();
    var basketJson = jsonDecode(data);
    basketModel = BasketModel.fromJson(basketJson);
  }

  removeBasketFromStorage()async{
    await Common.removeBasket();
  }

  void placeOrder(BuildContext context) {
    removeBasketFromStorage();
  }
}
