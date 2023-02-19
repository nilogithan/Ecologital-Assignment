// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:badges/badges.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View_Model.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Category_Cart.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Item_Cart.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Search_Bar.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
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
        return WillPopScope(
          onWillPop: () => model.onWillPop(context),
          child: Scaffold(
            backgroundColor: Themes.keyLight,
            appBar: AppBar(
              backgroundColor: Themes.keyLight,
              elevation: 0.0,
              // leading: Icon(
              //   Icons.menu,
              //   color: Themes.shadwoAsh,
              // ),
              actions: [
                InkWell(
                  onTap: (() => model.NavigateToBasket(context:context)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0,top: 30),
                    child: model.basketList != null && model.basketList!.isNotEmpty ? Badge(
                      badgeContent: TextThemes.subtitle("1", Themes.keyDark, 1),
                      position: BadgePosition.topEnd(top: -8,end: 16),
                      child: SvgPicture.asset(
                        "assets/svg/shoppingcart.svg",
                        height: 25.0,
                        color: Themes.shadwoAsh,
                      ),
                    )
                    :SvgPicture.asset(
                        "assets/svg/shoppingcart.svg",
                        height: 25.0,
                        color: Themes.shadwoAsh,
                      ),
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
                      SizedBox(
                        height: 100.0,
                        child: ListView.builder(
                            itemCount: model.categoryList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        model.categorySelect(context, index),
                                    child: CategoryCart(context,
                                        name: model.categoryList[index].name,
                                        imgUrl: model.categoryList[index].image,
                                        isSelect:
                                            model.selectedCatIndex == index &&
                                                model.isCatSelect),
                                  ),
                                  if (index != model.categoryList.length - 1)
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                ],
                              );
                            }),
                      ),
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
                    controller: model.scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                              onTap: () => model.NavigateToItemView(
                                  context, model.itemList![index]),
                              child: ItemCart(context,
                                  name: model.itemList![index].name,
                                  imgUrl: model.itemList![index].image,
                                  price: model.itemList![index].price)),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return model.isLoading
                          ? const CircularProgressIndicator()
                          : const SizedBox(
                              height: 4.0,
                            );
                    },
                  ),
                ],
              ),
            ),
            resizeToAvoidBottomInset: false,
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(context: context),
    );
  }
}
