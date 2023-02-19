// ignore_for_file: unused_import

import 'package:ecologital_assignment/Route.dart';
import 'package:ecologital_assignment/Screens/Init/Init_View.dart';
import 'package:ecologital_assignment/Screens/observables/locator.dart';
import 'package:ecologital_assignment/Screens/observables/service/Basket_Change_Service.dart';
import 'package:flutter/material.dart';

void main() {
 setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes,
      home:   InitView(),
    );
  }
}