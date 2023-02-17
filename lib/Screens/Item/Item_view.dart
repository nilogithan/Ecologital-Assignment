// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:ecologital_assignment/Screens/Item/Item_View_Model.dart';
import 'package:ecologital_assignment/Screens/Item/Widgets/Bottom_Button.dart';
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
              title: TextThemes.H2itle(model.item!.name, Themes.keyDark, 1),
              centerTitle: true,
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
                          height: MediaQuery.of(context).size.height*1/3,
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
                        TextThemes.H2itle("Rs ${model.item!.price}", Themes.keyDark, 1),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => model.changeCount(context:context,isIncrease:false),
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: Themes.shadwoAsh,
                                size: 30.0,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            TextThemes.H2itle(model.itemCount.toString(), Themes.keyDark, 1),
                            const SizedBox(
                              width: 8.0,
                            ),
                            InkWell(
                              onTap: () => model.changeCount(context:context,isIncrease:true),
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Themes.shadwoAsh,
                                size: 30.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextThemes.subtitle(model.item!.description, Themes.shadwoAsh, 8,textAlign: TextAlign.start),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  if(model.item!.unitType!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextThemes.boldtitle(
                            "Select size", Themes.shadwoAsh, 1),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: ListView.separated(itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: InkWell(
                          onTap: (() => model.sizeSelect(context:context,index: index)),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(model.selectedIndex == index ?Icons.radio_button_checked: Icons.radio_button_unchecked ,color: model.selectedIndex == index ?Themes.brandColor :Themes.shadwoAsh ,size: 30.0,),
                           const SizedBox(
                            width: 16.0,
                           ),
                            TextThemes.boldtitle(model.item!.unitType![index].value, Themes.keyDark, 1,textAlign: TextAlign.start),
                            const SizedBox(
                            width: 16.0,
                           ),
                            TextThemes.boldtitle("Rs.${model.item!.unitType![index].price}", Themes.shadwoAsh, 1,textAlign: TextAlign.start),
                            const SizedBox.shrink(),
                            const SizedBox.shrink(),
                          ],
                        
                                            ),
                        ),
                      );
                    }), separatorBuilder: (BuildContext context, int index){
                      return const SizedBox(
                        height: 16.0,
                      );
                    }, itemCount: model.item!.unitType!.length),
                  )
                  
                ],
              ),
            ),
            bottomNavigationBar: BottomButton(contextT: context,subTotal: model.subTotal,),
          );
        }),
        viewModelBuilder: () => ItemViewModel(),
        onModelReady: (model)=> model.initialise(context :context),);
  }
}
