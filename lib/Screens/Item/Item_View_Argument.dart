// ignore_for_file: file_names

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';

class ItemViewArgument{
  ItemModel? item;
  List<BasketModel>? basketList;
  bool isFromBasket;
  String itemId;
  int quantity ;

  ItemViewArgument({this.item,this.basketList,this.isFromBasket = false,this.itemId = "",this.quantity =1});
}