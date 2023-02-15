// ignore_for_file: file_names, implementation_imports, unnecessary_import

import 'package:ecologital_assignment/Models/Item_Model.dart';
import 'package:ecologital_assignment/Screens/Item/Item_View_Argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ItemViewModel extends BaseViewModel{
  ItemModel? item;
  ItemViewArgument? args;
  initialise({required BuildContext context}) {
    args = ModalRoute.of(context)!.settings.arguments as ItemViewArgument;
    if(args != null){
      item = args!.item;
    }
  }

}