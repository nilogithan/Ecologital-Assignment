// ignore_for_file: non_constant_identifier_names

import 'package:ecologital_assignment/Screens/Home/Widgets/Item_Cart.dart';
import 'package:flutter/material.dart';

Widget ItemList() {
  return ListView.separated(
    itemCount: 5,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemBuilder: (BuildContext context, int index) {
      return Row(
        children: [
          InkWell(child: ItemCart(context)),
        ],
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(
        height: 4.0,
      );
    },
  );
}
