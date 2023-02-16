// ignore_for_file: file_names, non_constant_identifier_names

import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Screens/Home/Widgets/Item_Cart.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:ecologital_assignment/Screens/Item/Item_view.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';

class ItemSearch extends SearchDelegate<String> {
  List<ItemModel> itemList;

  ItemSearch({required this.itemList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      InkWell(
        onTap: () {
          query = '';
          showSuggestions(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: query != ""
              ? Icon(
                  Icons.close,
                  color: Themes.shadwoAsh,
                )
              : const SizedBox.shrink(),
        ),
      ),
    ];
  }

  @override
  String get searchFieldLabel => "Search for foods";

  @override
  TextStyle get searchFieldStyle => const TextStyle(fontSize: 16);

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, '');
      },
      child: CircleAvatar(
          key: UniqueKey(),
          backgroundColor: Themes.keyLight,
          // radius: 30,
          child: Icon(
            Icons.arrow_back,
            color: Themes.shadwoAsh,
          )),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<ItemModel> suggestions = query.isEmpty
        ? itemList
        : itemList
            .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestions.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                      onTap: () => NavigateToItemView(context,suggestions[index]),
                      child: ItemCart(context,
                          name: suggestions[index].name,
                          imgUrl: suggestions[index].image,
                          price: suggestions[index].price),
                    ));
              }),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ItemModel> suggestions = query.isEmpty
        ? itemList
        : itemList
            .where((c) => c.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestions.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                       onTap: () => NavigateToItemView(context,suggestions[index]),
                      child: ItemCart(context,
                          name: suggestions[index].name,
                          imgUrl: suggestions[index].image,
                          price: suggestions[index].price),
                    ));
              }),
        ],
      ),
    );
  }
  
  NavigateToItemView(BuildContext context, ItemModel item) {
     Navigator.pushNamed(context, ItemView.routeName,
        arguments: ItemViewArgument(item: item));
  }
}
