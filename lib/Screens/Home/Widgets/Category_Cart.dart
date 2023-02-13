import 'package:ecologital_assignment/Screens/Home/Home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoryCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive( 
      builder: ((context, model, child) {
        return Scaffold();
      }),
    viewModelBuilder: () => HomeViewModel(),
    );
  }
}