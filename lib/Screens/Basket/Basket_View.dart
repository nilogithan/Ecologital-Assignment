// ignore_for_file: deprecated_member_use, file_names, use_key_in_widget_constructors

import 'package:ecologital_assignment/Screens/Basket/Basket_View_Model.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'Widgets/Bottom_Button.dart';

class BasketView extends StatelessWidget {
  static const routeName = "/basketView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasketViewModel>.reactive(
        viewModelBuilder: (() => BasketViewModel()),
        onModelReady: (model) => model.initialise(context: context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Themes.keyLight,
            appBar: AppBar(
              backgroundColor: Themes.keyLight,
              title: TextThemes.H2itle("Basket", Themes.keyDark, 1),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Themes.shadwoAsh, //change your color here
              ),
              elevation: 0.0,
            ),
            bottomNavigationBar: BasketBottomButton(subTotal: model.total!),
          );
        });
  }
}
