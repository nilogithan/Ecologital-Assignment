// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:ecologital_assignment/Screens/Home/Home_View_Model.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Category_Cart.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Category_List.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Search_Bar.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  static const routeName = "/homeView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            backgroundColor: Themes.keyLight,
            appBar: const SearchBox(),
            body: Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Expanded(child: CategoryList()),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(context: context),
    );
  }
}
