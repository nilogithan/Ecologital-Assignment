// ignore_for_file: file_names, implementation_imports, use_build_context_synchronously, unrelated_type_equality_checks, unnecessary_import, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View_Arguments.dart';
import 'package:ecologital_assignment/Services/Category_Service.dart';
import 'package:ecologital_assignment/Services/Item_Service.dart';
import 'package:ecologital_assignment/common/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class InitViewModel extends BaseViewModel {
  initialise({required BuildContext context}) async {
    // await Common.removeBasket();
    var caegory = await CategoryService.getAllCategory();
    var items = await ItemService.getAllItems(1);
    var basket = await Common.getBasket();
    var basketJson;
    List<BasketModel> basketList = [];
    if (basket != "") {
      basketJson = jsonDecode(basket);
      for (var item in basketJson) {
        var res = BasketModel.fromJson(item);
        basketList.add(res);
      }
      // basketModel = BasketModel.fromJson(basketJson);
    }

    
    if (caegory != null && items != null) {
      Navigator.pushNamed(context, HomeView.routeName,
          arguments: HoeViewArguments(
              categoryList: caegory,
              itemList: items,
              basketModel: basketList));
    }
  }
}
