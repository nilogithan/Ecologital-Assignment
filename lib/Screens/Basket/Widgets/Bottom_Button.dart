// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_renaming_method_parameters

import 'package:ecologital_assignment/Screens/Basket/Basket_View_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Widgets/Common_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class BasketBottomButton extends ViewModelWidget<BasketViewModel> {
   final BuildContext? contextT;
   final int subTotal;

  const BasketBottomButton({this.contextT,required this.subTotal});
  @override
  Widget build(BuildContext context, BasketViewModel model) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      height: 60,
      child: CommonBottomButtonLayout(
        buttontext: "Place order",
        margin: EdgeInsets.zero,
        subTotal: subTotal,
        onTap: () {
          model.placeOrder(context);
        },
      ),
    );
  }
}