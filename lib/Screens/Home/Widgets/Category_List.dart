// ignore_for_file: non_constant_identifier_names

import 'package:ecologital_assignment/Screens/Home/Widgets/Category_Cart.dart';
import 'package:flutter/material.dart';

Widget CategoryList(){
  return ListView.builder(
    itemCount: 5,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
     physics: const ClampingScrollPhysics(),
    itemBuilder: (BuildContext context, int index){
      return Row(
        children: [
          CategoryCart(context),
          if(index != 5)
          const SizedBox(
            width: 4.0,
          ),
        ],
      );
  }
  );
}