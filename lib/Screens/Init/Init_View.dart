// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use, unused_import

import 'package:ecologital_assignment/Screens/Init/Init_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class InitView extends StatelessWidget {
  static const routeName = "/initView";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.reactive(
      builder: ((context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/png/loading.png"),
                const SizedBox(
                  height: 32.0,
                ),
                const GFLoader(
                  type: GFLoaderType.ios,
                )
              ],
            ),
          ),
        );
      }),
      viewModelBuilder: () => InitViewModel(),
      onModelReady: (model) => model.initialise(context: context),
    );
  }
}
