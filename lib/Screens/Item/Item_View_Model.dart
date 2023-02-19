// ignore_for_file: implementation_imports, unnecessary_import, use_build_context_synchronously, file_names

import 'dart:convert';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:ecologital_assignment/common/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ItemViewModel extends BaseViewModel {
  ItemModel? item;
  ItemViewArgument? args;
  int selectedIndex = 0;
  int itemCount = 1;
  int subTotal = 0;
  int unitPrice = 0;
  BasketModel? basketModel;
  BasketUnitType? basketUnitType;
  List<BasketModel> basketList = [];

  initialise({required BuildContext context}) {
    args = ModalRoute.of(context)!.settings.arguments as ItemViewArgument;
    if (args != null) {
      item = args!.item;
      basketList = args!.basketList!;
      if (item!.unitType!.isNotEmpty &&
          item!.unitType![selectedIndex].price > item!.price) {
        subTotal = item!.unitType![selectedIndex].price;
      } else {
        subTotal = item!.price;
        unitPrice = subTotal;
      }
    }
  }

  sizeSelect({required BuildContext context, int? index}) {
    if (index != null) {
      selectedIndex = index;
    }
    if (item!.price < item!.unitType![selectedIndex].price) {
      subTotal = item!.unitType![selectedIndex].price * itemCount;
      unitPrice = item!.unitType![selectedIndex].price;
    } else {
      subTotal = item!.price * itemCount;
      unitPrice = item!.price;
    }
    notifyListeners();
  }

  changeCount({required BuildContext context, required bool isIncrease}) {
    if (isIncrease) {
      itemCount += 1;
      subTotal += unitPrice;
    } else {
      if (itemCount > 1) {
        itemCount -= 1;
        subTotal -= unitPrice;
      }
    }

    notifyListeners();
  }

  void prepairBasket(BuildContext context) async {
    bool alreadyAdded = false;
    if (item!.unitType!.isNotEmpty) {
      basketUnitType = BasketUnitType(
          name: item!.unitType![selectedIndex].name,
          value: item!.unitType![selectedIndex].value,
          price: item!.unitType![selectedIndex].price);
          basketModel = BasketModel(
        id: item!.id,
        basketId: "1",
        name: item!.name,
        image: item!.image,
        categoryId: item!.categoryId,
        categotyName: item!.categotyName,
        quantity: itemCount,
        price: item!.price,
        subTotal: subTotal,
        basket_unitType: basketUnitType,
        description: item!.description);
    }else{
      basketModel = BasketModel(
        id: item!.id,
        basketId: "1",
        name: item!.name,
        image: item!.image,
        categoryId: item!.categoryId,
        categotyName: item!.categotyName,
        quantity: itemCount,
        price: item!.price,
        subTotal: subTotal,
        basket_unitType: BasketUnitType(name: "",price: 0,value: ""),
        description: item!.description);
    }

    

    for (var item in basketList) {
      if (item.id == basketModel!.id) {
        alreadyAdded = true;
        item.quantity += basketModel!.quantity;
      }
    }
    if (!alreadyAdded) {
      basketList.add(basketModel!);
    }
  }

  addToBasket(BuildContext context) async {
    prepairBasket(context);
    var temp = json.encode(basketList);
    await Common.setBasket(temp);
    // debugPrint(data1.toString());
    Navigator.pushNamed(context, BasketView.routeName,
        arguments: BasketViewArgument(basketModel: basketList));
  }
}
