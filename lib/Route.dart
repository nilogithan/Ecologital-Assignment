// ignore_for_file: file_names

import 'package:ecologital_assignment/Screens/Basket/Basket_View.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View.dart';
import 'package:ecologital_assignment/Screens/Init/Init_View.dart';
import 'package:ecologital_assignment/Screens/Item/Item_view.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    HomeView.routeName: (context) => HomeView(),
    InitView.routeName: (context) => InitView(),
    ItemView.routeName: (context) => ItemView(),
    BasketView.routeName:(context) => BasketView(),
  };
}
