// ignore_for_file: non_constant_identifier_names, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';

Widget CategoryCart(BuildContext context,
    {String? name, imgUrl, required bool isSelect}) {
  // String imgUrl = "https://static.thenounproject.com/png/3735485-200.png";
  return Container(
    width: MediaQuery.of(context).size.width * 1 / 3,
    height: MediaQuery.of(context).size.height / 9,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2.0,
        ),
      ],
      color: isSelect ? Themes.brandColor : Themes.shadwoAsh,
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Column(
      children: [
        CachedNetworkImage(
          imageUrl: imgUrl,
          // fit: BoxFit.cover,
          height: 50.0,
          placeholder: (context, url) => Center(
            child: Image.asset(
              "assets/png/placeholder.png",
              fit: BoxFit.cover,
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Image.asset(
              "assets/png/placeholder.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Image.network(
        //   imgUrl,
        //   height: 50.0,
        // ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextThemes.subtitle(name, Themes.keyDark, 1),
          ],
        )
      ],
    ),
  );
}
