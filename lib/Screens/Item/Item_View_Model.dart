// ignore_for_file: implementation_imports, unnecessary_import, use_build_context_synchronously, file_names

import 'dart:convert';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:ecologital_assignment/Screens/observables/locator.dart';
import 'package:ecologital_assignment/Screens/observables/service/Basket_Change_Service.dart';
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
  String btnText = "Add to cart";
  bool isFromBasket = false;
  List<ItemModel> itemList = [];
  String itemId = "";

  initialise({required BuildContext context}) {
    args = ModalRoute.of(context)!.settings.arguments as ItemViewArgument;
    if (getIt<BasketChangeService>().basketChangeNotifier.basketList != null) {
      basketList =
          getIt<BasketChangeService>().basketChangeNotifier.basketList!;
    }
    if (args != null) {
      item = args!.item;
      isFromBasket = args!.isFromBasket;
      itemId = args!.itemId;
      itemCount = args!.quantity;
       itemList = getIt<BasketChangeService>().basketChangeNotifier.itemList!;
    if(itemList.isNotEmpty){
      for(var i in itemList){
        if(i.id == itemId){
          item = i;
        }
      }
      // item = itemList.where((element) => element.id == itemId) as ItemModel?;
    }
      // basketList = args!.basketList!;
      if (item!.unitType!.isNotEmpty &&
          item!.unitType![selectedIndex].price > item!.price) {
        subTotal = item!.unitType![selectedIndex].price;
      } else {
        subTotal = item!.price;
        unitPrice = subTotal;
      }
    }
    buttonTxt();
   
  }

  buttonTxt() {
    if (basketList.isNotEmpty) {
      for (var i in basketList) {
        if (i.id == item!.id) {
          btnText = "Update item";
          notifyListeners();
          itemCount = i.quantity;
          subTotal =
              item!.unitType != null && item!.unitType![selectedIndex].price > 0
                  ? item!.unitType![selectedIndex].price * itemCount
                  : item!.price * itemCount;
        }
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
    } else {
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
          basket_unitType: BasketUnitType(name: "", price: 0, value: ""),
          description: item!.description);
    }

    for (var item in basketList) {
      if (item.id == basketModel!.id &&
          item.basket_unitType!.value == basketModel!.basket_unitType!.value) {
        alreadyAdded = true;
        item.quantity = itemCount;
      }
    }
    if (!alreadyAdded) {
      basketList.add(basketModel!);
    } else {
      for (var i in basketList) {
        if (i.id == basketModel!.id) {
          basketList.remove(i);
          basketList.add(basketModel!);
          // i = basketModel!;
        }
      }
    }
  }

  addToBasket(BuildContext context) async {
    prepairBasket(context);
    var temp = json.encode(basketList);
    await Common.setBasket(temp);
    getIt<BasketChangeService>().basketChangeNotifier.basketChange(basketList);
    // debugPrint(data1.toString());
    Navigator.pushNamed(context, BasketView.routeName,
            arguments: BasketViewArgument(basketModel: basketList))
        .then((value) {
      buttonTxt();
      isFromBasket = true;
    });
  }
}
