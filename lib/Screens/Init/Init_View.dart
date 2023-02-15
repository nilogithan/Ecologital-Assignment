// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:ecologital_assignment/Screens/Init/Init_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class InitView extends StatelessWidget{
  static const routeName = "/initView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
     
       builder: ((context, model, child) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
       }),
        viewModelBuilder: ()=> InitViewModel(),
        onModelReady: (model) => model.initialise(context:context),
       );
  }
}