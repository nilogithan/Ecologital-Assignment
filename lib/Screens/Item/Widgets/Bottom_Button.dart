// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_renaming_method_parameters

import 'package:ecologital_assignment/Screens/Item/Item_View_Model.dart';
import 'package:ecologital_assignment/Screens/Item/Widgets/Common_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class BottomButton extends ViewModelWidget<ItemViewModel> {
   final BuildContext? contextT;
   final int subTotal;

  const BottomButton({this.contextT,required this.subTotal});
  @override
  Widget build(BuildContext context, ItemViewModel model) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      height: 60,
      child: CommonBottomButtonLayout(
        buttontext: "Add to cart",
        margin: EdgeInsets.zero,
        subTotal: subTotal,
        onTap: () {
          model.prepairBasket(context);
        },
      ),
    );
  }
}