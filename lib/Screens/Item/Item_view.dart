// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:ecologital_assignment/Screens/Item/Item_View_Model.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ItemView extends StatelessWidget {
  static const routeName = "/itemView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ItemViewModel>.reactive(
        builder: ((context, model, child) {
          return Scaffold(
            backgroundColor: Themes.keyLight,
            appBar: AppBar(
              backgroundColor: Themes.keyLight,
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: Themes.shadwoAsh, //change your color here
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          model.item!.image,
                          width: MediaQuery.of(context).size.width - 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextThemes.H2itle(model.item!.name, Themes.keyDark, 1),
                        Row(
                          children: [
                            Icon(
                              Icons.remove_circle_outline,
                              color: Themes.shadwoAsh,
                              size: 30.0,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            TextThemes.H2itle("0", Themes.keyDark, 1),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Icon(
                              Icons.add_circle_outline,
                              color: Themes.shadwoAsh,
                              size: 30.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextThemes.H2itle("Rs ${model.item!.price}", Themes.keyDark, 1),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextThemes.boldtitle(
                            "Select size", Themes.shadwoAsh, 1),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
        viewModelBuilder: () => ItemViewModel(),
        onModelReady: (model)=> model.initialise(context :context),);
  }
}
