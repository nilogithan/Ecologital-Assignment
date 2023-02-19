// ignore_for_file: file_names

import 'package:ecologital_assignment/Models/BasketModel.dart';

class BasketViewArgument{
  List<BasketModel>? basketModel ;
  bool isFromHome ;

  BasketViewArgument({this.basketModel,this.isFromHome = false});
}