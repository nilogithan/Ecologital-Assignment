// ignore_for_file: non_constant_identifier_names

import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';

Widget ItemCart(BuildContext context, {String? name, imgUrl}) {
  String imgUrl =
      "https://media-cdn.tripadvisor.com/media/photo-s/08/b3/38/cf/pizza-milano.jpg";
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width - 20,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imgUrl,
                height: 50.0,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextThemes.boldtitle("Chicken Pizza", Themes.keyDark, 1),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextThemes.boldtitle("Rs.900", Themes.shadwoAsh, 1),
              ],
            ),
            const SizedBox(
              width: 4.0,
            )
          ],
        ),
      ),
    ],
  );
}
