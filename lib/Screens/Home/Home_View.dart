// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:ecologital_assignment/Screens/Home/Home_View_Model.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Category_List.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Item_Cart.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Search_Bar.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  static const routeName = "/homeView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Themes.keyLight,
          appBar: AppBar(
            backgroundColor: Themes.keyLight,
            elevation: 0.0,
            leading: Icon(
              Icons.menu,
              color: Themes.shadwoAsh,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  "assets/svg/shoppingcart.svg",
                  height: 25.0,
                  color: Themes.shadwoAsh,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView(
              children: [
                const SearchBox(),
                Column(
                  children: [
                    CategoryList(model.categoryList),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
                ListView.separated(
                  itemCount: model.itemList!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () => model.NavigateToItemView(context,model.itemList![index]),
                          child: ItemCart(context,name: model.itemList![index].name,imgUrl: model.itemList![index].image,price: model.itemList![index].price)),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 4.0,
                    );
                  },
                ),
              ],
            ),
          ),
          resizeToAvoidBottomInset: false,
        );
      },
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(context: context),
    );
  }
}
