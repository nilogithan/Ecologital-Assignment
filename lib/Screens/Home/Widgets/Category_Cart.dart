// ignore_for_file: non_constant_identifier_names

import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';

Widget CategoryCart(BuildContext context,{String? name, imgUrl}) {
  String imgUrl = "https://static.thenounproject.com/png/3735485-200.png";
  return Container(
    width: MediaQuery.of(context).size.width * 1/3,
    height: MediaQuery.of(context).size.height/9,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2.0,
        ),
      ],
      color: Themes.brandColor,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Column(
      children: [
        Image.network(
          imgUrl,
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextThemes.subtitle("text", Themes.keyLight, 1),
          ],
        )
      ],
    ),
  );
}
