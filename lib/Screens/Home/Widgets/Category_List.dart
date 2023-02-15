// ignore_for_file: non_constant_identifier_names, file_names

import 'package:ecologital_assignment/Models/Cateegory_Model.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Category_Cart.dart';
import 'package:flutter/material.dart';

Widget CategoryList(List<CategoryModel> list){
  return SizedBox(
    height: 100.0,
    child: ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
       physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return Row(
          children: [
            CategoryCart(context,name: list[index].name,imgUrl: list[index].image),
            if(index != list.length - 1)
            const SizedBox(
              width: 4.0,
            ),
          ],
        );
    }
    ),
  );
}