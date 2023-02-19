// ignore_for_file: non_constant_identifier_names, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';

Widget ItemCart(BuildContext context, {String? name, String? imgUrl,int? price}) {
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
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
          imageUrl: imgUrl!,
          // fit: BoxFit.cover,
          height: 50.0,
          placeholder: (context, url) => Center(
            child: Image.asset(
              "assets/png/placeholder.png",
              fit: BoxFit.cover,
              color:Themes.shadwoAsh,
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Image.asset(
              "assets/png/placeholder.png",
              fit: BoxFit.cover,
              color:Themes.shadwoAsh,
            ),
          ),
        ),
               
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextThemes.boldtitle(name, Themes.keyDark, 1),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextThemes.boldtitle("Rs.$price", Themes.shadwoAsh, 1),
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
