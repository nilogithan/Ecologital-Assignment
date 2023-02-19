// ignore_for_file: file_names

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Models/Cateegory_Model.dart';
import 'package:ecologital_assignment/Models/Item_Model.dart';

class HoeViewArguments{
  List<CategoryModel>? categoryList;
  List<ItemModel>? itemList;
  List<BasketModel>? basketModel;

  HoeViewArguments({this.categoryList,this.itemList,this.basketModel});
}