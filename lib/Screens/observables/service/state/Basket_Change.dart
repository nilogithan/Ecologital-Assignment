// ignore_for_file: file_names

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:flutter/material.dart';

class BasketChange extends ChangeNotifier {
  List<BasketModel>?  basketList;
  bool _isAppInit = true;
  List<ItemModel>? itemList;

  void basketChange(List<BasketModel>? value) {
    basketList = value;
    notifyListeners();
  }
void setItemList(List<ItemModel>? value) {
    itemList = value;
    notifyListeners();
  }

  void isAppInitSet(bool val){
    _isAppInit = val;
    notifyListeners();
  }

  List<BasketModel>? get basketListModel => basketList ?? [];
  bool get isAppInit => _isAppInit;
  List<ItemModel>? get itemListModel => itemList ?? [];
}
