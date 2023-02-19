// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_renaming_method_parameters

import 'package:ecologital_assignment/Models/BasketModel.dart';
import 'package:ecologital_assignment/Screens/Basket/Basket_View_Model.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BasketItem extends ViewModelWidget<BasketViewModel>{
  final BuildContext? contextT;
  final BasketModel? basketModel;
  const BasketItem({this.contextT,this.basketModel});
  @override
  Widget build(BuildContext context, BasketViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 75,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Themes.shadowColor,
              blurRadius: 2.0,
            ),
          ],
          // color: Themes.brandColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  basketModel!.image,
                  height: 80.0,
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: TextThemes.boldtitle(basketModel!.name, Themes.keyDark, 1)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextThemes.subtitle(basketModel!.basket_unitType!.value, Themes.shadwoAsh, 1),
                    ],
                  ),
                ],
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextThemes.boldtitle("${basketModel!.quantity}", Themes.shadwoAsh, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.close,color: Themes.shadwoAsh,size: 15.0,),
              ],
            ),
            const SizedBox(
              width:16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextThemes.boldtitle("Rs.${basketModel!.basket_unitType!.price != 0? basketModel!.basket_unitType!.price : basketModel!.price}", Themes.shadwoAsh, 1),
              ],
            ),
            const SizedBox(
              width: 4.0,
            )
          ],
        ),
      ),
      ],
  ),
    );
  }
}