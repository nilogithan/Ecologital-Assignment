// ignore_for_file: deprecated_member_use, file_names, use_key_in_widget_constructors

import 'package:ecologital_assignment/Screens/Basket/Basket_View_Model.dart';
import 'package:ecologital_assignment/Screens/Basket/Widgets/Basket_Item.dart';
import 'package:ecologital_assignment/Themes/Text_Theme.dart';
import 'package:ecologital_assignment/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';

import 'Widgets/Bottom_Button.dart';

class BasketView extends StatelessWidget {
  static const routeName = "/basketView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasketViewModel>.reactive(
        viewModelBuilder: (() => BasketViewModel()),
        onModelReady: (model) => model.initialise(context: context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Themes.keyLight,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Themes.keyLight,
              title: TextThemes.H2itle("Basket", Themes.keyDark, 1),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Themes.shadwoAsh, //change your color here
              ),
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: model.basketList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right:0.0),
                      child: Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          dismissible: DismissiblePane(onDismissed: () {
                            // we can able to perform to some action here
                          }),
                          motion: const DrawerMotion(),
                          children: [
                            SlidableAction(
                              autoClose: true,
                              flex: 1,
                              onPressed: (value) {
                                model.deleteItem(context,index:index);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              autoClose: true,
                              flex: 1,
                              onPressed: (value) {
                                model.editItem(index:index);
                              },
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                          ],
                        ),
                        child: BasketItem(contextT: context,basketModel: model.basketList![index],)
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return const SizedBox(
                      height: 4.0,
                    );
                   },
                ),
                model.isLoading ? Center(child: CircularProgressIndicator(color: Themes.brandColor,))
                : const SizedBox.shrink()
              ],
            ),
            bottomNavigationBar: BasketBottomButton(contextT: context,subTotal: model.total,),
          );
        });
  }
}
