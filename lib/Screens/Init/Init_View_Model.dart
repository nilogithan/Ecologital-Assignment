// ignore_for_file: file_names, implementation_imports, use_build_context_synchronously, unrelated_type_equality_checks, unnecessary_import, unnecessary_null_comparison

import 'package:ecologital_assignment/Screens/Home/Home_View.dart';
import 'package:ecologital_assignment/Screens/Home/Home_View_Arguments.dart';
import 'package:ecologital_assignment/Services/Category_Service.dart';
import 'package:ecologital_assignment/Services/Item_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class InitViewModel extends BaseViewModel{
  initialise({required BuildContext context}) async{
    var caegory = await CategoryService.getAllCategory();
    var items = await ItemService.getAllItems(1);
     if(caegory != null && items != null){
       Navigator.pushNamed(context,HomeView.routeName,arguments: HoeViewArguments(categoryList: caegory,itemList: items));
     }
  }
}